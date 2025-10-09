#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
OTUI Documentation Generator for OTClient v8
Generates Markdown documentation with frontmatter from OTUI widget files.
"""

import os
import re
import sys
import hashlib
from pathlib import Path
from datetime import datetime, timezone
from typing import List, Dict, Optional, Tuple

# Repository root
REPO_ROOT = Path(__file__).resolve().parents[3]
DOCS_OUTPUT = REPO_ROOT / "docs" / "reposzablony" / "04_ui" / "otui"
DIAGRAMS_OUTPUT = REPO_ROOT / "docs" / "reposzablony" / "04_ui" / "diagrams"


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
        sha = result.stdout.strip()
        return sha if sha else "unknown"
    except Exception:
        return "unknown"


def get_iso_timestamp() -> str:
    """Get current ISO timestamp."""
    return datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


def generate_doc_id(source_path: str) -> str:
    """Generate stable doc_id from source path."""
    hash_obj = hashlib.md5(source_path.encode('utf-8'))
    return f"otui-ui-{hash_obj.hexdigest()[:12]}"


class OTUIParser:
    """Simple OTUI widget parser."""
    
    def __init__(self, content: str, file_path: Path):
        self.content = content
        self.lines = content.split('\n')
        self.file_path = file_path
        self.widgets = []
        
    def parse(self):
        """Parse the OTUI file."""
        self._extract_widgets()
        
    def _extract_widgets(self):
        """Extract widget definitions."""
        i = 0
        while i < len(self.lines):
            line = self.lines[i].strip()
            
            # Match widget declaration: WidgetType < ParentType
            match = re.match(r'^(\w+)\s*<\s*(\w+)', line)
            if match:
                widget_class = match.group(1)
                parent_class = match.group(2)
                
                # Extract properties
                props = self._extract_properties(i + 1)
                
                # Extract id if present
                widget_id = props.get('id', widget_class)
                
                self.widgets.append({
                    'id': widget_id,
                    'class': widget_class,
                    'parent': parent_class,
                    'properties': props,
                    'line': i + 1
                })
            
            i += 1
    
    def _extract_properties(self, start_idx: int) -> Dict[str, str]:
        """Extract widget properties."""
        props = {}
        indent_level = None
        
        for i in range(start_idx, len(self.lines)):
            line = self.lines[i]
            stripped = line.strip()
            
            # Skip empty and comments
            if not stripped or stripped.startswith('//') or stripped.startswith('#'):
                continue
            
            # Detect end of block (dedent or new widget)
            if indent_level is not None:
                current_indent = len(line) - len(line.lstrip())
                if current_indent <= indent_level and stripped:
                    if re.match(r'^\w+\s*<\s*\w+', stripped):
                        break
            
            # Set indent level from first property
            if indent_level is None and stripped:
                indent_level = len(line) - len(line.lstrip())
            
            # Match property: key: value
            prop_match = re.match(r'^([a-zA-Z-_]+)\s*:\s*(.+)$', stripped)
            if prop_match:
                key = prop_match.group(1)
                value = prop_match.group(2).strip()
                props[key] = value
        
        return props


def generate_markdown(parser: OTUIParser, source_path: str, rel_path: str, abs_path: Path) -> str:
    """Generate markdown documentation."""
    lines = []
    
    # Frontmatter
    doc_id = generate_doc_id(source_path)
    source_sha = get_git_sha(abs_path)
    timestamp = get_iso_timestamp()
    
    lines.append('---')
    lines.append(f'doc_id: "{doc_id}"')
    lines.append(f'source_path: "{source_path}"')
    lines.append(f'source_sha: "{source_sha}"')
    lines.append(f'last_sync_iso: "{timestamp}"')
    lines.append('doc_class: "ui"')
    lines.append('language: "pl"')
    lines.append(f'title: "UI: {Path(source_path).name}"')
    lines.append(f'summary: "Dokumentacja interfejsu OTUI dla {source_path}"')
    lines.append('tags: ["otui", "ui", "widget"]')
    lines.append('---')
    lines.append('')
    
    # Title
    lines.append(f'# {source_path}')
    lines.append('')
    
    # Overview
    lines.append('## Overview')
    lines.append('')
    lines.append(f'Plik OTUI definiujący interfejs użytkownika dla {Path(source_path).stem}.')
    lines.append('')
    
    # Widgets table
    if parser.widgets:
        lines.append('## Widgets')
        lines.append('')
        lines.append('| ID | Class | Parent | Key Properties |')
        lines.append('|----|-------|--------|----------------|')
        
        for widget in parser.widgets:
            widget_id = widget['id']
            widget_class = widget['class']
            parent = widget['parent']
            
            # Key properties (show first 3)
            key_props = []
            for key in ['visible', 'enabled', 'size', 'anchors']:
                if key in widget['properties']:
                    key_props.append(f"{key}={widget['properties'][key]}")
            
            if not key_props:
                # Show any 3 properties
                for key, val in list(widget['properties'].items())[:3]:
                    key_props.append(f"{key}={val}")
            
            props_str = ', '.join(key_props[:3])
            lines.append(f'| `{widget_id}` | `{widget_class}` | `{parent}` | {props_str} |')
        
        lines.append('')
    
    # Detailed widget info
    if parser.widgets:
        lines.append('## Widget Details')
        lines.append('')
        
        for widget in parser.widgets:
            lines.append(f'### `{widget["id"]}`')
            lines.append('')
            lines.append(f'- **Klasa:** `{widget["class"]}`')
            lines.append(f'- **Rodzic:** `{widget["parent"]}`')
            
            if widget['properties']:
                lines.append('- **Właściwości:**')
                for key, val in widget['properties'].items():
                    lines.append(f'  - `{key}`: {val}')
            
            lines.append('')
    
    # Graph diagram reference
    if parser.widgets:
        lines.append('## Hierarchy Diagram')
        lines.append('')
        diagram_rel_path = f"../diagrams/{Path(rel_path).stem}.mmd"
        lines.append(f'Zobacz: [{diagram_rel_path}]({diagram_rel_path})')
        lines.append('')
    
    return '\n'.join(lines)


def generate_hierarchy_diagram(parser: OTUIParser, rel_path: str) -> Optional[str]:
    """Generate Mermaid graph TD of widget hierarchy."""
    if not parser.widgets:
        return None
    
    lines = ['graph TD']
    
    # Build hierarchy
    for idx, widget in enumerate(parser.widgets):
        node_id = f"W{idx}"
        node_label = f"{widget['id']} ({widget['class']})"
        lines.append(f'    {node_id}["{node_label}"]')
        
        # Try to find parent widget
        parent_class = widget['parent']
        for pidx, parent_widget in enumerate(parser.widgets):
            if parent_widget['class'] == parent_class or parent_widget['id'] == parent_class:
                parent_node_id = f"W{pidx}"
                lines.append(f'    {parent_node_id} --> {node_id}')
                break
    
    # Limit diagram size
    if len(lines) > 80:
        return None
    
    return '\n'.join(lines)


def process_otui_file(otui_path: Path, base_dir: Path):
    """Process a single OTUI file."""
    # Calculate relative path
    rel_path = otui_path.relative_to(base_dir)
    source_path_str = str(rel_path).replace('\\', '/')
    
    # Read content
    try:
        content = otui_path.read_text(encoding='utf-8', errors='ignore')
    except Exception as e:
        print(f"Error reading {otui_path}: {e}", file=sys.stderr)
        return
    
    # Parse
    parser = OTUIParser(content, otui_path)
    parser.parse()
    
    # Generate markdown
    markdown = generate_markdown(parser, source_path_str, str(rel_path), otui_path)
    
    # Output path
    out_path = DOCS_OUTPUT / rel_path.with_suffix('.md')
    out_path.parent.mkdir(parents=True, exist_ok=True)
    
    # Check if content changed (idempotency)
    if out_path.exists():
        existing = out_path.read_text(encoding='utf-8')
        if existing == markdown:
            return  # No change
    
    # Write
    out_path.write_text(markdown, encoding='utf-8', newline='\n')
    print(f"Generated: {out_path.relative_to(REPO_ROOT)}")
    
    # Generate diagram
    diagram = generate_hierarchy_diagram(parser, str(rel_path))
    if diagram:
        diagram_path = DIAGRAMS_OUTPUT / f"{rel_path.stem}.mmd"
        diagram_path.parent.mkdir(parents=True, exist_ok=True)
        
        if diagram_path.exists():
            existing_diagram = diagram_path.read_text(encoding='utf-8')
            if existing_diagram == diagram:
                return
        
        diagram_path.write_text(diagram, encoding='utf-8', newline='\n')
        print(f"Generated diagram: {diagram_path.relative_to(REPO_ROOT)}")


def main():
    """Main entry point."""
    import argparse
    
    parser = argparse.ArgumentParser(description='Generate OTUI documentation')
    parser.add_argument('--source-dir', type=str, default='modules',
                        help='Source directory to scan (default: modules)')
    args = parser.parse_args()
    
    source_dir = REPO_ROOT / args.source_dir
    if not source_dir.exists():
        print(f"Error: {source_dir} does not exist", file=sys.stderr)
        sys.exit(1)
    
    # Find all OTUI files
    otui_files = list(source_dir.rglob('*.otui'))
    
    print(f"Found {len(otui_files)} OTUI files in {source_dir}")
    
    # Process each file
    for otui_path in sorted(otui_files):
        process_otui_file(otui_path, source_dir)
    
    print(f"\nCompleted! Documentation written to {DOCS_OUTPUT.relative_to(REPO_ROOT)}")


if __name__ == '__main__':
    main()
