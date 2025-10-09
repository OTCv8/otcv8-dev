#!/usr/bin/env python3
# scripts/repair_encoding.py
# Naprawa zmojibakowanych polskich znaków w plikach Markdown.

from __future__ import annotations
import argparse
import pathlib
import sys
import re

POLISH_CHARS = "ąćęłńóśżźĄĆĘŁŃÓŚŻŹ"
POLISH_RE = re.compile(r"[{}]".format(POLISH_CHARS))

MOJIBAKE_HINTS = [
    "Å", "Ä", "Ã", "Â", "Ĺ", "Ě", "Ă", "Ľ", "Â€", "Â", "Ë", "Ð",
    "ModuĹ", "PrzeglÄ", "Å¼", "Å‚", "Ã³", "Ã„", "Ã…", "Ãł",
]

def count_polish(text: str) -> int:
    return len(POLISH_RE.findall(text))

def looks_mojibake(text: str) -> bool:
    # heurystyka: występują typowe śmieci i mało polskich liter
    hints = any(h in text for h in MOJIBAKE_HINTS)
    has_pl = count_polish(text) > 0
    return hints or not has_pl

def try_fix_variants(text: str) -> str | None:
    # Warianty naprawy: interpretuj bieżący UTF-8-jako-latin1 itp.
    candidates = []
    def safe(reencode, label):
        try:
            return reencode(), label
        except Exception:
            return None

    # Najczęstsze: tekst jest poprawnym Unicode, ale powstał z (utf8 bytes) -> (latin1 decode)
    out = safe(lambda: text.encode("latin1", errors="ignore").decode("utf-8", errors="ignore"), "latin1->utf8")
    if out: candidates.append(out)

    # Windows-1250
    out = safe(lambda: text.encode("cp1250", errors="ignore").decode("utf-8", errors="ignore"), "cp1250->utf8")
    if out: candidates.append(out)

    # Czasem podwójne kombinacje
    out = safe(lambda: text.encode("latin1", errors="ignore").decode("cp1250", errors="ignore"), "latin1->cp1250")
    if out: candidates.append(out)

    if not candidates:
        return None

    # Wybierz wariant z większą liczbą polskich znaków i mniejszą liczbą „śmieci”
    def score(s: str) -> tuple[int, int]:
        return (count_polish(s), -sum(s.count(h) for h in MOJIBAKE_HINTS))

    best = max(candidates, key=lambda x: score(x[0]))
    fixed, label = best
    # akceptuj tylko, jeśli rzeczywiście lepiej
    if score(fixed) > score(text):
        return fixed
    return None

def process_file(path: pathlib.Path, write: bool) -> bool:
    try:
        raw = path.read_text(encoding="utf-8")
        utf8_ok = True
    except UnicodeDecodeError:
        # plik nie jest w utf-8 — spróbuj jako cp1250 i od razu konwertuj do utf-8
        raw = path.read_text(encoding="cp1250", errors="strict")
        utf8_ok = False

    changed = False
    new = raw

    if not utf8_ok or looks_mojibake(raw):
        fixed = try_fix_variants(raw)
        if fixed and fixed != raw:
            new = fixed
            changed = True

    if changed and write:
        path.write_text(new, encoding="utf-8", newline="\n")
    return changed

def main():
    ap = argparse.ArgumentParser(description="Napraw zmojibakowane polskie znaki w docs/")
    ap.add_argument("--root", default="docs", help="katalog z dokumentacją (default: docs)")
    ap.add_argument("--dry-run", action="store_true", help="tylko pokazuj zmiany")
    args = ap.parse_args()

    root = pathlib.Path(args.root)
    if not root.exists():
        print(f"Nie znaleziono katalogu: {root}", file=sys.stderr)
        return 2

    md_files = sorted(root.rglob("*.md"))
    if not md_files:
        print("Brak plików .md do sprawdzenia.")
        return 0

    changed = []
    for p in md_files:
        if process_file(p, write=not args.dry_run):
            changed.append(p)

    if args.dry_run:
        if changed:
            print("Do naprawy (podgląd):")
            for p in changed:
                print(" -", p.as_posix())
        else:
            print("Wygląda dobrze – brak zmojibake.")
    else:
        if changed:
            print("Naprawiono i zapisano:")
            for p in changed:
                print(" -", p.as_posix())
        else:
            print("Nic nie wymagało zmian.")

    return 0

if __name__ == "__main__":
    raise SystemExit(main())
