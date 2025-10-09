#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Generator mkdocs.yml dla OTCv8.

Użycie:
  python scripts/generate_mkdocs.py --dry-run
  python scripts/generate_mkdocs.py
"""

from __future__ import annotations

import argparse
import sys
import re
import unicodedata
from pathlib import Path
from typing import Optional, List, Dict, Any

try:
    import yaml  # pip install pyyaml
except Exception:
    print("ERROR: Brak pakietu PyYAML. Zainstaluj: pip install pyyaml", file=sys.stderr)
    raise

# --- ŚCIEŻKI -----------------------------------------------------------------

REPO_ROOT = Path(__file__).resolve().parents[1]
DOCS_DIR = REPO_ROOT / "docs"

STRUCTURED_DIR = DOCS_DIR / "modules" / "structured"
CORE_DIR = STRUCTURED_DIR / "core"
GAMEPLAY_DIR = STRUCTURED_DIR / "gameplay"
DEVTOOLS_DIR = STRUCTURED_DIR / "dev_tools"

# --- MOJIBAKE FIX -----------------------------------------------------------

_MOJIBAKE_FIXES = {
    "ModuĹ‚": "Moduł",
    "PrzeglÄ…d": "Przegląd",
    "Åº": "ź",
    "Å›": "ś",
    "Ĺ›": "ś",
    "Ä‡": "ć",
    "Ä™": "ę",
    "Ĺ„": "ń",
    "Ĺ‚": "ł",
    "Ĺ»": "Ż",
    "Ĺş": "ś",
    "Ĺš": "Ś",
    "Ä…": "ą",
    "Ä†": "Ć",
    "Ĺź": "ź",
    "ŹrĂłdeł": "Źródeł",
    "ŻrĂłdeł": "Źródeł",
}

def fix_mojibake(s: str) -> str:
    if not s:
        return s
    s = unicodedata.normalize("NFC", s)
    for bad, good in _MOJIBAKE_FIXES.items():
        s = s.replace(bad, good)
    return s

# Akceptuje zarówno poprawne "Moduł", jak i popsute "ModuĹ‚", opcjonalny pipe i spacje
_RE_MODUL_PREFIX = re.compile(r"^\s*(?:\|\s*)?(?:Modu(?:ł|l)|ModuĹ‚)\s*:?\s*", flags=re.IGNORECASE)

def normalize_module_title(raw_heading: Optional[str], fallback: str) -> str:
    """
    - zdejmij wiodący '| '
    - popraw mojibake i normalizuj Unicode
    - jeżeli nie zaczyna się od 'Moduł:' -> dopnij
    - zredukuj powtórzenia 'Moduł: '
    """
    title = (raw_heading or fallback or "").strip()
    title = fix_mojibake(title)
    title = re.sub(r"^\s*\|\s*", "", title)  # usuń '|' na początku

    if not _RE_MODUL_PREFIX.match(title):
        title = f"Moduł: {title}"

    title = re.sub(r"^(?:Moduł:\s*)+(.*)$", r"Moduł: \1", title, flags=re.IGNORECASE).strip()
    return title

def read_first_h1(md_path: Path) -> Optional[str]:
    try:
        txt = md_path.read_text(encoding="utf-8", errors="replace")
    except Exception:
        return None
    txt = unicodedata.normalize("NFC", txt)
    m = re.search(r"(?m)^\s*#\s+(.*)\s*$", txt)
    return m.group(1).strip() if m else None

# --- SKŁADANIE NAV ----------------------------------------------------------

def list_module_files(category_dir: Path) -> List[Path]:
    if not category_dir.exists():
        return []
    return sorted(
        (p for p in category_dir.glob("modul-*.md") if p.is_file()),
        key=lambda p: p.name.lower()
    )

def build_category_nav(_category_name: str, category_dir: Path) -> List[Dict[str, str]]:
    items: List[Dict[str, str]] = []
    index_md = category_dir / "INDEX.md"
    if index_md.exists():
        items.append({"INDEX": rel_path(index_md)})

    for md in list_module_files(category_dir):
        raw_h1 = read_first_h1(md)
        fallback = md.stem.replace("modul-", "").replace("-", " ").strip()
        title = normalize_module_title(raw_heading=raw_h1, fallback=fallback)
        items.append({title: rel_path(md)})

    return items

def rel_path(p: Path) -> str:
    return str(p.relative_to(DOCS_DIR)).replace("\\", "/")

# --- KONFIG MKDOCS ----------------------------------------------------------

def build_mkdocs_config() -> Dict[str, Any]:
    nav: List[Any] = []

    # Start
    start_md = DOCS_DIR / "index.md"
    if start_md.exists():
        nav.append({"Start": rel_path(start_md)})

    # Architektura (statyczne)
    arch_items = []
    static_arch = [
        ("Przegląd wysokopoziomowy", DOCS_DIR / "guides" / "architecture.md"),
        ("Przegląd klienta (C++)",    DOCS_DIR / "architektura" / "client_overview.md"),
        ("Framework (C++)",           DOCS_DIR / "architektura" / "framework_overview.md"),
        ("Struktura źródeł (client)", DOCS_DIR / "architektura" / "src_client.md"),
        ("Struktura źródeł (framework)", DOCS_DIR / "architektura" / "src_framework.md"),
    ]
    for t, p in static_arch:
        if p.exists():
            arch_items.append({fix_mojibake(t): rel_path(p)})
    if arch_items:
        nav.append({"Architektura": arch_items})

    # API
    api_items = []
    engine_items = []
    engine_files = [
        ("Specyfikacja UI", DOCS_DIR / "api" / "engine" / "otclient_v_8_specyfikacja_ui.md"),
        ("Walidator",       DOCS_DIR / "api" / "engine" / "otclient_v_8_walidator_macierze_ast_i_round_trip_specyfikacja_techniczna.md"),
    ]
    for t, p in engine_files:
        if p.exists():
            engine_items.append({fix_mojibake(t): rel_path(p)})
    if engine_items:
        api_items.append({"Engine": engine_items})

    lua_items = []
    lua_files = [
        ("Style guide", DOCS_DIR / "lua" / "style-guide.md"),
        ("Referencja klienta", DOCS_DIR / "api" / "lua" / "luafunctions_client.md"),
        ("Zbiorcze", DOCS_DIR / "api" / "otcv8-full-api.md"),
    ]
    for t, p in lua_files:
        if p.exists():
            lua_items.append({fix_mojibake(t): rel_path(p)})
    if lua_items:
        api_items.append({"Lua": lua_items})

    if api_items:
        nav.append({"API": api_items})

    # Moduły (skanowane)
    modules_items = []
    core_items = build_category_nav("Core",   CORE_DIR)
    if core_items: modules_items.append({"Core": core_items})
    gameplay_items = build_category_nav("Gameplay", GAMEPLAY_DIR)
    if gameplay_items: modules_items.append({"Gameplay": gameplay_items})
    devtools_items = build_category_nav("Dev tools", DEVTOOLS_DIR)
    if devtools_items: modules_items.append({"Dev tools": devtools_items})
    if modules_items:
        nav.append({"Moduły": modules_items})

    cfg: Dict[str, Any] = {
        "site_name": "OTCv8 Dev — Dokumentacja",
        "site_url": "https://lukaszj321.github.io/otcv8-dev/",
        "repo_url": "https://github.com/lukaszj321/otcv8-dev",
        "repo_name": "lukaszj321/otcv8-dev",
        "use_directory_urls": True,
        "theme": {
            "name": "material",
            "language": "pl",
            "features": [
                "navigation.instant",
                "navigation.tracking",
                "navigation.tabs",
                "navigation.sections",
                "navigation.expand",
                "navigation.indexes",
                "navigation.top",
                "content.code.copy",
                "content.action.edit",
                "content.action.view",
                "search.suggest",
                "search.highlight",
                "header.autohide",
            ],
            "palette": [
                {"scheme": "default", "primary": "blue", "accent": "indigo"}
            ],
            "font": {"text": "Roboto", "code": "Fira Code"},
            "icon": {"repo": "fontawesome/brands/github"},
            "logo": "_assets/img/logo.svg",
            "favicon": "_assets/img/favicon.png",
        },
        "extra_css": ["_assets/css/title-fix.css"],
        "plugins": [
            "search",
            "glightbox",
            "macros",
            {
                "git-revision-date-localized": {
                    "enable_creation_date": True,
                    "type": "timeago",
                    "fallback_to_build_date": True,
                }
            },
            "redirects",  # pip install mkdocs-redirects
        ],
        "markdown_extensions": [
            "admonition",
            "attr_list",
            "md_in_html",
            "tables",
            {"toc": {"permalink": True, "separator": "-"}},
            "pymdownx.details",
            "pymdownx.superfences",
            "pymdownx.highlight",
            "pymdownx.inlinehilite",
            "pymdownx.keys",
            "pymdownx.critic",
            "pymdownx.tilde",
            {
                "pymdownx.emoji": {
                    "emoji_index": "material.extensions.emoji.twemoji",
                    "emoji_generator": "material.extensions.emoji.to_svg",
                }
            },
        ],
        "nav": nav,
        "redirect_maps": {
            "guides/architecture.md": "architektura/client_overview.md",
            "modules/modules_core.md": "modules/structured/core/INDEX.md",
            "modules/modules_game_1.md": "modules/structured/gameplay/INDEX.md",
            "modules/modules_game_2.md": "modules/structured/gameplay/INDEX.md",
            "modules/modules_misc.md": "modules/structured/dev_tools/INDEX.md",
        },
    }
    return cfg

# --- IO ---------------------------------------------------------------------

def dump_yaml(cfg: Dict[str, Any]) -> str:
    """
    Yaml z allow_unicode, bez niestandardowego Dumpera (zgodne z różnymi
    wersjami PyYAML — unika błędu 'multiple values for Dumper').
    """
    return yaml.dump(
        cfg,
        allow_unicode=True,
        sort_keys=False,
        width=1000,
        default_flow_style=False,
    )

def write_mkdocs(cfg: Dict[str, Any], dry_run: bool) -> None:
    yml = dump_yaml(cfg)
    if dry_run:
        print(yml)
    else:
        out = REPO_ROOT / "mkdocs.yml"
        out.write_text(yml, encoding="utf-8", errors="strict")
        print(f"Zapisano: {out}")

# --- MAIN -------------------------------------------------------------------

def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(description="Generator mkdocs.yml (OTCv8)")
    parser.add_argument("--dry-run", action="store_true", help="wypisz na stdout zamiast pisać mkdocs.yml")
    args = parser.parse_args(argv)

    cfg = build_mkdocs_config()
    write_mkdocs(cfg, dry_run=args.dry_run)
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
