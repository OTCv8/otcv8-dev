#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Naprawa mojibake w docs/modules/structured/**/*.md
Użycie:
  python scripts/fix_mojibake_modules.py --dry-run
  python scripts/fix_mojibake_modules.py
"""

from __future__ import annotations
import argparse
import sys
from pathlib import Path

# Heurystyka: „śmieciowe” ciągi pojawiające się przy złym dekodowaniu UTF-8
MOJIBAKE_MARKERS = (
    "Ã", "Å", "Ä", "â", "ê", "Ĺ", "Ě", "ď", "Ĺ", "Ľ", "Ĺş", "Å", "Å", "Åº",
    "Å", "Å¼", "Ä™", "Ä", "Ä", "Ä", "Ä", "Ä", "Ĺş", "Ĺ»", "Ĺ"
)

# Polski zestaw – jeśli pojawi się w wyniku, to dobry znak
POLISH_CHARS = set("ąćęłńóśżź ĄĆĘŁŃÓŚŻŹ")

def looks_mojibake(s: str) -> bool:
    return any(m in s for m in MOJIBAKE_MARKERS)

def has_polish(s: str) -> bool:
    return any(ch in POLISH_CHARS for ch in s)

def try_unmangle_once(s: str) -> str | None:
    """
    Spróbuj odwinąć najczęstszy przypadek:
    tekst był kiedyś UTF-8, ale zdekodowany jako 8-bit (latin1/cp1250/iso-8859-2),
    a potem zapisany ponownie jako UTF-8.
    Heurystycznie testujemy kilka ścieżek.
    """
    candidates = []
    for enc in ("latin1", "cp1250", "iso-8859-2"):
        try:
            fixed = s.encode(enc, errors="strict").decode("utf-8", errors="strict")
            candidates.append(fixed)
        except Exception:
            pass

    # wybierz najlepszego kandydata: preferuj taki, który:
    # 1) nie wygląda na mojibake
    # 2) ma polskie znaki
    # 3) ma mniej „śmieci” niż oryginał
    if not candidates:
        return None

    def score(txt: str) -> tuple[int, int]:
        bad = sum(txt.count(m) for m in MOJIBAKE_MARKERS)
        pol = sum(1 for ch in txt if ch in POLISH_CHARS)
        # mniej bad = lepiej; więcej pol = lepiej
        return (-bad, pol)

    best = max(candidates, key=score)
    # jeśli faktycznie poprawia sytuację – zwróć
    if score(best) > score(s) or (looks_mojibake(s) and not looks_mojibake(best)):
        return best
    return None

def unmangle(s: str) -> str:
    # Wykonaj do dwóch przejść – czasem trzeba podwójnego „odwinięcia”
    for _ in range(2):
        fixed = try_unmangle_once(s)
        if not fixed or fixed == s:
            break
        s = fixed
    return s

def process_file(path: Path, dry_run: bool) -> bool:
    original = path.read_text(encoding="utf-8", errors="replace")
    if not looks_mojibake(original):
        return False

    fixed = unmangle(original)

    # dodatkowa heurystyka: jeśli nadal wygląda podejrzanie, ale poprawiliśmy dużo, i są polskie znaki — i tak zapisz
    improved = (fixed != original) and (looks_mojibake(fixed) is False or has_polish(fixed))

    if improved:
        if dry_run:
            print(f"[DRY] Naprawiłbym: {path}")
        else:
            # backup
            bak = path.with_suffix(path.suffix + ".bak")
            if not bak.exists():
                bak.write_text(original, encoding="utf-8", errors="strict")
            path.write_text(fixed, encoding="utf-8", errors="strict")
            print(f"[OK ] Naprawiono: {path}")
        return True
    return False

def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--dry-run", action="store_true", help="Tylko pokaż co by się zmieniło")
    parser.add_argument("--root", default="docs/modules/structured", help="Katalog startowy (domyślnie: docs/modules/structured)")
    args = parser.parse_args()

    root = Path(args.root)
    if not root.exists():
        print(f"Nie znaleziono katalogu: {root}", file=sys.stderr)
        return 2

    changed = 0
    for md in root.rglob("*.md"):
        try:
            if process_file(md, args.dry_run):
                changed += 1
        except Exception as e:
            print(f"[ERR] {md}: {e}", file=sys.stderr)

    if args.dry_run:
        print(f"\n[DRY] Plików do naprawy: {changed}")
    else:
        print(f"\nGotowe. Zmieniono plików: {changed}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
