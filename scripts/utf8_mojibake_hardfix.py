#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
utf8_mojibake_hardfix.py
Naprawa polskich znaków i znaków interpunkcyjnych po klasycznym zjebaniu
UTF-8 -> Windows-1252/Latin-1 -> UTF-8 ("krĂłtko â€“", "Ĺ‚", "Å›", itp.).

Użycie:
  python scripts/utf8_mojibake_hardfix.py            # zapisuje zmiany
  python scripts/utf8_mojibake_hardfix.py --dry-run  # tylko pokaże, co by zmienił
  python scripts/utf8_mojibake_hardfix.py path1 path2 ...  # opcjonalnie konkretne pliki/katalogi

Domyślnie przechodzi po docs/**/*.md
"""

from __future__ import annotations
import sys
import re
from pathlib import Path
from typing import Iterable

MOJIBAKE_MARKERS = (
    "Â", "Ă", "Å", "Ä", "â€“", "â€”", "â€", "Ã", "Ĺ", "", ""
)

# Dodatkowe szybkie zamiany po naprawie bajtowej (typowe śmieci NBSP itd.)
POST_REPL = [
    ("\u00A0", " "),   # NBSP -> spacja
    ("\u202F", " "),   # NNBSP -> spacja
    ("\u2009", " "),   # thin space -> spacja
    ("\u200B", ""),    # zero width space -> usuń
]

# Czasem Markdown-y mają legacy strzałki itp. po złej konwersji — poprawmy najczęstsze
EXTRA_FIXES = [
    ("->", "→"),
    ("<-", "←"),
]

def looks_mojibaked(text: str) -> bool:
    return any(m in text for m in MOJIBAKE_MARKERS)

def unmojibake_once(text: str) -> str:
    """
    Spróbuj odwrócić błędne dekodowanie: interpretuj aktualny tekst jako Latin-1 (bytes),
    a następnie zdekoduj te bajty jako UTF-8.
    """
    try:
        raw = text.encode("latin-1", "ignore")
        fixed = raw.decode("utf-8", "ignore")
        return fixed
    except Exception:
        return text  # jak coś pójdzie nie tak, oddaj oryginał

def hard_fix(text: str) -> str:
    """
    Zrób 1-3 iteracje odwracania, aż przestanie się zmieniać lub znikną markery.
    Następnie zrób porządki na whitespace i parę drobnych zamian.
    """
    prev = text
    for _ in range(3):
        if not looks_mojibaked(prev):
            break
        curr = unmojibake_once(prev)
        if curr == prev:
            break
        prev = curr

    # post-clean
    out = prev
    for bad, good in POST_REPL:
        out = out.replace(bad, good)

    # Kilka bezpiecznych, opcjonalnych poprawek typografii (wykomentuj, jeśli nie chcesz)
    for a, b in EXTRA_FIXES:
        out = out.replace(a, b)

    # Zbędne trailing whitespace
    out = re.sub(r"[ \t]+\n", "\n", out)

    return out

def iter_target_files(paths: Iterable[Path]) -> Iterable[Path]:
    if not paths:
        # domyślnie wszystkie .md w docs/
        yield from Path("docs").rglob("*.md")
        return
    for p in paths:
        if p.is_dir():
            yield from p.rglob("*.md")
        elif p.is_file() and p.suffix.lower() == ".md":
            yield p

def main(argv: list[str]) -> int:
    dry_run = "--dry-run" in argv or "-n" in argv
    arg_paths = [Path(a) for a in argv if a not in ("--dry-run", "-n")]

    changed = 0
    checked = 0

    for f in iter_target_files(arg_paths):
        try:
            original = f.read_text(encoding="utf-8", errors="strict")
        except UnicodeDecodeError:
            # gdyby ktoś jednak wrzucił nie-utf8, czytamy binarnie i próbujemy
            original_bytes = f.read_bytes()
            try:
                original = original_bytes.decode("utf-8", errors="replace")
            except Exception:
                # ostatnia deska: latin-1 -> utf-8
                original = original_bytes.decode("latin-1", errors="replace")

        fixed = hard_fix(original)
        checked += 1

        if fixed != original:
            changed += 1
            rel = f.as_posix()
            if dry_run:
                print(f"[DRY] Naprawiłbym: {rel}")
            else:
                f.write_text(fixed, encoding="utf-8", errors="strict")
                print(f"[OK ] Naprawiono: {rel}")

    if dry_run:
        print(f"\n[DRY] Plików do naprawy: {changed}")
    else:
        print(f"\nGotowe. Zmieniono plików: {changed} / sprawdzono: {checked}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
