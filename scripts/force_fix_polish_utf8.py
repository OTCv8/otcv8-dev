#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Brutalne naprawianie polskich mojibake w plikach Markdown:
- przechodzi po docs/**/*.md
- zamienia znane sekwencje śmieciowe (latin1/cp1250/iso-8859-2 źle zdekodowane) na poprawne UTF-8
- robi kopię *.bak
Użycie:
  python scripts/force_fix_polish_utf8.py --dry-run
  python scripts/force_fix_polish_utf8.py
Opcjonalnie:
  python scripts/force_fix_polish_utf8.py --root docs/modules/structured
"""

from __future__ import annotations
import argparse
from pathlib import Path

# Twarda mapa zamian - obejmuje popularne warianty (Å‚ i Ĺ‚ itp.)
REPLACEMENTS = {
    # małe
    "Ã…‚": "ł", "Å‚": "ł", "Ĺ‚": "ł",
    "Ã…›": "ś", "Å›": "ś", "Ĺ›": "ś",
    "Ã…¼": "ż", "Å¼": "ż", "Ĺ»": "Ż",  # uwaga: poniżej też damy duże
    "Ã…º": "ź", "Åº": "ź", "Ĺº": "ź",
    "Ã„…": "ą", "Ä…": "ą",
    "Ã„‡": "ć", "Ä‡": "ć",
    "Ã„™": "ę", "Ä™": "ę",
    "Ã…„": "ń", "Å„": "ń", "Ĺ„": "Ń",
    "Ã³": "ó", "Ã“": "Ó",
    "Ã…›": "ś",
    "Ã…¼": "ż",
    "Ã…º": "ź",

    # duże
    "Ã…": "Ł", "Å": "Ł", "Ĺ": "Ł",
    "Ã…š": "Ś", "Åš": "Ś", "Ĺš": "Ś",
    "Ã…»": "Ż", "Å»": "Ż",
    "Ã…¹": "Ź", "Å¹": "Ź", "Ĺ¹": "Ź",
    "Ã„„": "Ą", "Ä„": "Ą",
    "Ã„†": "Ć", "Ä†": "Ć",
    "Ã„˜": "Ę", "Ä˜": "Ę",
    "Ã…ƒ": "Ń", "Åƒ": "Ń",
    "Ã“": "Ó",

    # częste pary losowo spotykane przy podwójnym psuciu:
    "ModuÅ‚": "Moduł", "ModuĹ‚": "Moduł",
    "PrzeglÄ…d": "Przegląd",
    "Wysokopoziomowy": "Wysokopoziomowy",  # zostawione dla spójności
}

# Dodatkowo — pojedyncze znaki (większy zasięg)
CHAR_MAP = [
    ("Ã„…", "ą"), ("Ã„‡", "ć"), ("Ã„™", "ę"), ("Ã…‚", "ł"),
    ("Ã…„", "ń"), ("Ã³", "ó"), ("Ã…›", "ś"), ("Ã…º", "ź"), ("Ã…¼", "ż"),
    ("Ã„„", "Ą"), ("Ã„†", "Ć"), ("Ã„˜", "Ę"), ("Ã…", "Ł"),
    ("Ã…ƒ", "Ń"), ("Ã“", "Ó"), ("Ã…š", "Ś"), ("Ã…¹", "Ź"), ("Ã…»", "Ż"),
    ("Ä…", "ą"), ("Ä‡", "ć"), ("Ä™", "ę"), ("Å‚", "ł"),
    ("Å„", "ń"), ("Å›", "ś"), ("Åº", "ź"), ("Å¼", "ż"),
    ("Ä„", "Ą"), ("Ä†", "Ć"), ("Ä˜", "Ę"), ("Å", "Ł"),
    ("Åƒ", "Ń"), ("Åš", "Ś"), ("Å¹", "Ź"), ("Å»", "Ż"),
    ("Ĺ‚", "ł"), ("Ĺ›", "ś"), ("Ĺº", "ź"), ("Ĺ¼", "ż"),
    ("Ĺ", "Ł"), ("Ĺš", "Ś"), ("Ĺ¹", "Ź"), ("Ĺ»", "Ż"),
]

def fix_text_hard(text: str) -> str:
    # 1) globalne podmiany ciągów znanych
    for bad, good in REPLACEMENTS.items():
        if bad in text:
            text = text.replace(bad, good)
    # 2) pojedyncze znaki — iteracja kilka razy (czasem łańcuchowo się poprawia)
    for _ in range(2):
        changed = False
        for bad, good in CHAR_MAP:
            if bad in text:
                text = text.replace(bad, good)
                changed = True
        if not changed:
            break
    return text

def process_file(path: Path, dry: bool) -> bool:
    original = path.read_text(encoding="utf-8", errors="replace")
    fixed = fix_text_hard(original)
    if fixed != original:
        if dry:
            print(f"[DRY] Naprawiłbym: {path}")
        else:
            bak = path.with_suffix(path.suffix + ".bak")
            if not bak.exists():
                bak.write_text(original, encoding="utf-8")
            path.write_text(fixed, encoding="utf-8")
            print(f"[OK ] Naprawiono: {path}")
        return True
    return False

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--root", default="docs", help="Katalog startowy (domyślnie: docs)")
    args = ap.parse_args()

    root = Path(args.root)
    if not root.exists():
        print(f"Brak katalogu: {root}")
        return 2

    changed = 0
    for md in root.rglob("*.md"):
        try:
            if process_file(md, args.dry_run):
                changed += 1
        except Exception as e:
            print(f"[ERR] {md}: {e}")

    if args.dry_run:
        print(f"\n[DRY] Plików do naprawy: {changed}")
    else:
        print(f"\nGotowe. Zmieniono plików: {changed}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
