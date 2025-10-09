#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Events/Emitters Documentation Generator for OTClient v8
Detects and documents event patterns in C++ and Lua code.
"""

import os
import re
import sys
import hashlib
import csv
import json
from pathlib import Path
from datetime import datetime, timezone
from typing import List, Dict, Optional

# Repository root
REPO_ROOT = Path(__file__).resolve().parents[3]
DOCS_OUTPUT = REPO_ROOT / "docs" / "reposzablony" / "05_events"
DATASETS_OUTPUT = REPO_ROOT / "docs" / "reposzablony" / "datasets"


def get_git_sha(file_path: Path) -> str:
    """Get abbreviated git SHA for a file."""
    try:
        import subprocess
        result = subprocess.run(
            ["git", "log", "-1", "--format=%h", "--", str(file_path)],
            cwd=REPO_ROOT,
            capture_output=True,
            text=True,
            timeout=5
        )
        return result.stdout.strip() or "unknown"
    except Exception:
        return "unknown"


def get_iso_timestamp() -> str:
    """Get current ISO timestamp."""
    return datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


class EventDetector:
    """Detect event emitters and handlers."""
    
    def __init__(self):
        self.events = []
        
        # C++ patterns
        self.cpp_patterns = [
            (r'\b(dispatch|emit|signal)\s*\(', 'emitter'),
            (r'\bsigc::signal\b', 'signal_def'),
            (r'\bboost::signals2\b', 'signal_def'),
            (r'\baddEvent\s*\(', 'emitter'),
            (r'\bg_dispatcher\b', 'emitter'),
        ]
        
        # Lua patterns
        self.lua_patterns = [
            (r'\bconnect\s*\(', 'handler'),
            (r'\bon[A-Z][A-Za-z]+\s*\(', 'handler'),
            (r'\baddEvent\s*\(', 'emitter'),
            (r'\bschedule\s*\(', 'emitter'),
            (r'\bsignal\s*\(', 'emitter'),
            (r'\bg_ui\.\w+', 'ui_event'),
        ]
    
    def scan_file(self, file_path: Path, lang: str):
        """Scan a file for event patterns."""
        try:
            content = file_path.read_text(encoding='utf-8', errors='ignore')
        except Exception as e:
            return
        
        lines = content.split('\n')
        patterns = self.cpp_patterns if lang == 'cpp' else self.lua_patterns
        
        for i, line in enumerate(lines):
            for pattern, event_type in patterns:
                if re.search(pattern, line):
                    # Extract symbol if possible
                    symbol_match = re.search(r'(\w+)\s*\(', line)
                    symbol = symbol_match.group(1) if symbol_match else 'unknown'
                    
                    self.events.append({
                        'ts': get_iso_timestamp(),
                        'id': f"{file_path.name}:{i+1}",
                        'source': str(file_path.relative_to(REPO_ROOT)),
                        'emitter': 'true' if 'emitter' in event_type else 'false',
                        'handler': 'true' if 'handler' in event_type else 'false',
                        'symbol': symbol,
                        'lang': lang,
                        'file': str(file_path.relative_to(REPO_ROOT)),
                        'line': i + 1,
                        'line_text': line.strip()[:100]
                    })


def generate_events_index(events: List[Dict]) -> str:
    """Generate events index markdown."""
    lines = []
    
    # Frontmatter
    lines.append('---')
    lines.append('doc_id: "events-index-main"')
    lines.append('source_path: "events/detection"')
    lines.append('source_sha: "generated"')
    lines.append(f'last_sync_iso: "{get_iso_timestamp()}"')
    lines.append('doc_class: "spec"')
    lines.append('language: "pl"')
    lines.append('title: "Indeks Zdarzeń"')
    lines.append('summary: "Wykryte emitery i handlery zdarzeń w OTClient v8"')
    lines.append('tags: ["events", "emitters", "handlers"]')
    lines.append('---')
    lines.append('')
    
    # Title
    lines.append('# Indeks Zdarzeń')
    lines.append('')
    
    # Overview
    lines.append('## Overview')
    lines.append('')
    lines.append(f'Wykryto **{len(events)}** zdarzeń w kodzie źródłowym.')
    lines.append('')
    
    # Stats
    cpp_events = [e for e in events if e['lang'] == 'cpp']
    lua_events = [e for e in events if e['lang'] == 'lua']
    emitters = [e for e in events if e['emitter'] == 'true']
    handlers = [e for e in events if e['handler'] == 'true']
    
    lines.append('### Statystyki')
    lines.append('')
    lines.append(f'- **C++:** {len(cpp_events)} zdarzeń')
    lines.append(f'- **Lua:** {len(lua_events)} zdarzeń')
    lines.append(f'- **Emitery:** {len(emitters)}')
    lines.append(f'- **Handlery:** {len(handlers)}')
    lines.append('')
    
    # Top symbols
    symbol_counts = {}
    for event in events:
        symbol = event['symbol']
        symbol_counts[symbol] = symbol_counts.get(symbol, 0) + 1
    
    top_symbols = sorted(symbol_counts.items(), key=lambda x: x[1], reverse=True)[:10]
    
    if top_symbols:
        lines.append('### Top Symbole')
        lines.append('')
        lines.append('| Symbol | Liczba Wystąpień |')
        lines.append('|--------|------------------|')
        for symbol, count in top_symbols:
            lines.append(f'| `{symbol}` | {count} |')
        lines.append('')
    
    # Datasets
    lines.append('## Datasets')
    lines.append('')
    lines.append('- CSV: [datasets/events.csv](../datasets/events.csv)')
    lines.append('- NDJSON: [datasets/events.ndjson](../datasets/events.ndjson)')
    lines.append('')
    
    return '\n'.join(lines)


def write_events_datasets(events: List[Dict]):
    """Write events to CSV and NDJSON datasets."""
    DATASETS_OUTPUT.mkdir(parents=True, exist_ok=True)
    
    # CSV
    csv_path = DATASETS_OUTPUT / "events.csv"
    with open(csv_path, 'w', newline='', encoding='utf-8') as f:
        if events:
            writer = csv.DictWriter(f, fieldnames=['ts', 'id', 'source', 'emitter', 'handler', 'symbol', 'lang', 'file', 'line'])
            writer.writeheader()
            for event in events:
                # Remove line_text for CSV
                row = {k: v for k, v in event.items() if k != 'line_text'}
                writer.writerow(row)
    
    print(f"Generated: {csv_path.relative_to(REPO_ROOT)}")
    
    # NDJSON
    ndjson_path = DATASETS_OUTPUT / "events.ndjson"
    with open(ndjson_path, 'w', encoding='utf-8') as f:
        for event in events:
            f.write(json.dumps(event, ensure_ascii=False) + '\n')
    
    print(f"Generated: {ndjson_path.relative_to(REPO_ROOT)}")


def main():
    """Main entry point."""
    print("Scanning for events...")
    
    detector = EventDetector()
    
    # Scan C++ files
    for ext in ['*.h', '*.hpp', '*.hxx', '*.cpp']:
        for cpp_file in (REPO_ROOT / 'src').rglob(ext):
            detector.scan_file(cpp_file, 'cpp')
        for cpp_file in (REPO_ROOT / 'modules').rglob(ext):
            detector.scan_file(cpp_file, 'cpp')
    
    # Scan Lua files
    for lua_file in (REPO_ROOT / 'modules').rglob('*.lua'):
        detector.scan_file(lua_file, 'lua')
    for lua_file in (REPO_ROOT / 'mods').rglob('*.lua'):
        detector.scan_file(lua_file, 'lua')
    
    print(f"Found {len(detector.events)} events")
    
    # Generate index
    DOCS_OUTPUT.mkdir(parents=True, exist_ok=True)
    index_md = generate_events_index(detector.events)
    index_path = DOCS_OUTPUT / "index.md"
    index_path.write_text(index_md, encoding='utf-8', newline='\n')
    print(f"Generated: {index_path.relative_to(REPO_ROOT)}")
    
    # Write datasets
    write_events_datasets(detector.events)
    
    print("\nCompleted! Event detection finished.")


if __name__ == '__main__':
    main()
