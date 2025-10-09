#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Cross-Reference Builder for OTClient v8
Builds relations between API, Lua, and OTUI elements.
"""

import os
import re
import csv
from pathlib import Path
from typing import List, Dict, Set
from collections import defaultdict

# Repository root
REPO_ROOT = Path(__file__).resolve().parents[3]
DOCS_BASE = REPO_ROOT / "docs" / "reposzablony"
RELATIONS_OUTPUT = DOCS_BASE / "relations"


def extract_doc_id(md_file: Path) -> str:
    """Extract doc_id from frontmatter."""
    try:
        content = md_file.read_text(encoding='utf-8', errors='ignore')
        match = re.search(r'^doc_id:\s*"([^"]+)"', content, re.MULTILINE)
        if match:
            return match.group(1)
    except Exception:
        pass
    return ""


def find_lua_calls_to_api(lua_content: str) -> Set[str]:
    """Find Lua calls that likely reference C++ API."""
    calls = set()
    
    # Common patterns: g_<namespace>.<function>, Module.<function>
    patterns = [
        r'\bg_(\w+)\.(\w+)',           # g_game.walk, g_ui.displayUI
        r'\b([A-Z]\w+)\.(\w+)',        # Game.walk, UI.displayUI
        r'\b([A-Z]\w+):(\w+)',         # object:method()
    ]
    
    for pattern in patterns:
        for match in re.finditer(pattern, lua_content):
            calls.add(f"{match.group(1)}.{match.group(2)}")
    
    return calls


def find_lua_ui_connections(lua_content: str) -> Set[str]:
    """Find Lua connections to OTUI elements."""
    connections = set()
    
    # UI element access patterns
    patterns = [
        r'(?:getChildById|recursiveGetChildById)\(["\']([^"\']+)["\']\)',
        r'rootWidget:getChildById\(["\']([^"\']+)["\']\)',
        r'self:getChildById\(["\']([^"\']+)["\']\)',
        r'connect\(.*?function\(',  # Event handlers
    ]
    
    for pattern in patterns:
        for match in re.finditer(pattern, lua_content):
            if match.groups():
                connections.add(match.group(1))
    
    return connections


def find_events(content: str, lang: str) -> Set[str]:
    """Find event emitters/handlers."""
    events = set()
    
    if lang == 'cpp':
        patterns = [
            r'\bemit\s+(\w+)',
            r'\bsignal\s+(\w+)',
            r'\baddEvent\(["\'](\w+)["\']\)',
        ]
    else:  # lua
        patterns = [
            r'\bconnect\(["\']?(\w+)["\']?',
            r'\bon([A-Z]\w+)\s*\(',
            r'\baddEvent\(["\'](\w+)["\']\)',
        ]
    
    for pattern in patterns:
        for match in re.finditer(pattern, content):
            events.add(match.group(1))
    
    return events


def build_relations():
    """Build relations between documentation elements."""
    print("Building cross-references...")
    
    relations = []
    doc_ids = {}
    
    # Step 1: Collect all doc_ids
    print("  Collecting doc_ids...")
    for md_file in DOCS_BASE.rglob('*.md'):
        if md_file.is_relative_to(DOCS_BASE / "_tools"):
            continue
        if any(x in str(md_file) for x in ['chapter_', 'README.md']):
            continue
        
        doc_id = extract_doc_id(md_file)
        if doc_id:
            doc_ids[doc_id] = md_file
    
    print(f"  Found {len(doc_ids)} documents with doc_ids")
    
    # Step 2: Analyze Lua files for API calls and UI connections
    print("  Analyzing Lua files...")
    lua_dir = DOCS_BASE / "03_modules" / "lua"
    if lua_dir.exists():
        for lua_md in lua_dir.rglob('*.md'):
            from_id = extract_doc_id(lua_md)
            if not from_id:
                continue
            
            # Read source Lua file (reconstruct path)
            rel_path = lua_md.relative_to(lua_dir).with_suffix('.lua')
            
            # Try to find actual source
            source_paths = [
                REPO_ROOT / "modules" / rel_path,
                REPO_ROOT / "mods" / rel_path,
            ]
            
            for source_path in source_paths:
                if source_path.exists():
                    try:
                        lua_content = source_path.read_text(encoding='utf-8', errors='ignore')
                        
                        # Find API calls
                        api_calls = find_lua_calls_to_api(lua_content)
                        for call in api_calls:
                            relations.append({
                                'from_id': from_id,
                                'to_id': f'api-{call}',
                                'rel_type': 'calls',
                                'source': str(rel_path),
                                'line': '0'
                            })
                        
                        # Find UI connections
                        ui_connections = find_lua_ui_connections(lua_content)
                        for conn in ui_connections:
                            relations.append({
                                'from_id': from_id,
                                'to_id': f'ui-{conn}',
                                'rel_type': 'handles',
                                'source': str(rel_path),
                                'line': '0'
                            })
                        
                        # Find events
                        events = find_events(lua_content, 'lua')
                        for event in events:
                            relations.append({
                                'from_id': from_id,
                                'to_id': f'event-{event}',
                                'rel_type': 'handles',
                                'source': str(rel_path),
                                'line': '0'
                            })
                    except Exception as e:
                        pass
                    break
    
    # Step 3: Analyze C++ files for events
    print("  Analyzing C++ files...")
    cpp_dir = DOCS_BASE / "01_core" / "api" / "cpp"
    if cpp_dir.exists():
        for cpp_md in cpp_dir.rglob('*.md'):
            from_id = extract_doc_id(cpp_md)
            if not from_id:
                continue
            
            # Reconstruct source path
            rel_path = cpp_md.relative_to(cpp_dir).with_suffix('.h')
            source_paths = [
                REPO_ROOT / "src" / rel_path,
                REPO_ROOT / "modules" / rel_path,
            ]
            
            for source_path in source_paths:
                if source_path.exists():
                    try:
                        cpp_content = source_path.read_text(encoding='utf-8', errors='ignore')
                        events = find_events(cpp_content, 'cpp')
                        for event in events:
                            relations.append({
                                'from_id': from_id,
                                'to_id': f'event-{event}',
                                'rel_type': 'emits',
                                'source': str(rel_path),
                                'line': '0'
                            })
                    except Exception:
                        pass
                    break
    
    print(f"  Found {len(relations)} relations")
    
    # Write relations.csv
    RELATIONS_OUTPUT.mkdir(parents=True, exist_ok=True)
    csv_path = RELATIONS_OUTPUT / "relations.csv"
    
    with open(csv_path, 'w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=['from_id', 'to_id', 'rel_type', 'source', 'line'])
        writer.writeheader()
        writer.writerows(relations)
    
    print(f"Generated: {csv_path.relative_to(REPO_ROOT)}")
    
    # Generate matrix
    generate_matrix(relations)
    
    return relations


def generate_matrix(relations: List[Dict]):
    """Generate relations matrix."""
    print("  Generating matrix...")
    
    # Count relations by type
    by_type = defaultdict(lambda: defaultdict(int))
    
    for rel in relations:
        from_type = rel['from_id'].split('-')[0]
        to_type = rel['to_id'].split('-')[0]
        rel_type = rel['rel_type']
        by_type[from_type][to_type] += 1
    
    # Generate markdown matrix
    lines = ['# Relations Matrix', '']
    lines.append('Macierz powiązań między elementami systemu.')
    lines.append('')
    
    # Get all types
    all_types = set()
    for from_t in by_type:
        all_types.add(from_t)
        for to_t in by_type[from_t]:
            all_types.add(to_t)
    
    all_types = sorted(all_types)
    
    # Table header
    lines.append('| From \\ To | ' + ' | '.join(all_types) + ' |')
    lines.append('|-----------|' + '|'.join(['---'] * len(all_types)) + '|')
    
    # Table rows
    for from_t in all_types:
        row = [from_t]
        for to_t in all_types:
            count = by_type[from_t].get(to_t, 0)
            row.append(str(count) if count > 0 else '-')
        lines.append('| ' + ' | '.join(row) + ' |')
    
    lines.append('')
    lines.append('## Summary')
    lines.append('')
    lines.append(f'Total relations: {len(relations)}')
    lines.append('')
    
    # By rel_type
    rel_types = defaultdict(int)
    for rel in relations:
        rel_types[rel['rel_type']] += 1
    
    lines.append('By type:')
    for rel_type, count in sorted(rel_types.items()):
        lines.append(f'- **{rel_type}**: {count}')
    
    matrix_path = RELATIONS_OUTPUT / "matrix.md"
    matrix_path.write_text('\n'.join(lines), encoding='utf-8', newline='\n')
    print(f"Generated: {matrix_path.relative_to(REPO_ROOT)}")


def main():
    """Main entry point."""
    build_relations()
    print("\nCompleted! Relations built successfully.")


if __name__ == '__main__':
    main()
