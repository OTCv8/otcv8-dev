#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re, argparse
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DOCS = ROOT / "docs"

# reguły: normalizacja tytułów H1, spójność "Moduł:"
H1_RE = re.compile(r'^\s*#\s*(.+?)\s*$', re.M)

def normalize_title(line: str) -> str:
    t = line.strip().lstrip("#").strip()
    # jeżeli brak prefiksu – dodaj
    if not t.lower().startswith("moduł"):
        t = f"Moduł: {t}"
    # pojedyncze spacje, poprawne backticki
    t = re.sub(r'\s+', ' ', t)
    return f"# {t}"

def clean_file(p: Path, do_write: bool) -> bool:
    try:
        txt = p.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        txt = p.read_text(encoding="cp1250", errors="replace")

    orig = txt

    # Napraw H1 (pierwsze)
    def repl(m):
        return normalize_title(m.group(0))
    txt = H1_RE.sub(repl, txt, count=1)

    # Ujednolicenia drobne
    txt = txt.replace("Modul:", "Moduł:")  # literówka EN->PL
    txt = re.sub(r"Moduł\s*:\s*", "Moduł: ", txt)

    changed = (txt != orig)
    if changed and do_write:
        p.write_text(txt, encoding="utf-8", newline="\n")
    return changed

def rename_if_needed(p: Path, do_write: bool) -> Path:
    # przykładowa reguła: spójnik pomiędzy "game" a resztą na myślnik
    # (dopasuj do swoich preferencji – albo usuń, jeśli nie chcesz rename)
    name = p.name
    new_name = name
    new_name = new_name.replace("modul-game_", "modul-game_")  # zostaw jak jest
    # przykładowo: zamień podwójne myślniki/underscores na pojedyncze
    new_name = re.sub(r'__+', '_', new_name)
    new_name = re.sub(r'--+', '-', new_name)

    if new_name != name:
        new_path = p.with_name(new_name)
        if do_write:
            p.rename(new_path)
        return new_path
    return p

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--force", action="store_true", help="Wykonaj zmiany (domyślnie podgląd)")
    args = ap.parse_args()

    targets = [
        DOCS / "modules" / "structured" / "core",
        DOCS / "modules" / "structured" / "gameplay",
        DOCS / "modules" / "structured" / "dev_tools",
        DOCS / "modules" / "structured" / "bot_tools",
    ]

    total = changed = ren = 0
    for base in targets:
        if not base.exists():
            continue
        for p in sorted(base.glob("*.md")):
            total += 1
            np = rename_if_needed(p, args.force)
            if clean_file(np, args.force):
                changed += 1
            if np != p:
                ren += 1
                print(("RENAME -> " if args.force else "RENAME (dry) -> ") + str(np))

    print(f"Done. Files seen: {total}, changed: {changed}, renamed: {ren}")
    if not args.force:
        print("To apply changes: python scripts/clean_structured_docs.py --force")

if __name__ == "__main__":
    main()
