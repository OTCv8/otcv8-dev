#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Lua Documentation Generator for OTClient v8
Generates Markdown documentation with frontmatter from Lua modules.
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
DOCS_OUTPUT = REPO_ROOT / "docs" / "reposzablony" / "03_modules" / "lua"


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
    return f"lua-spec-{hash_obj.hexdigest()[:12]}"


class LuaParser:
    """Simple Lua module parser."""
    
    def __init__(self, content: str, file_path: Path):
        self.content = content
        self.lines = content.split('\n')
        self.file_path = file_path
        self.globals = []
        self.functions = []
        self.events = []
        self.examples = []
        
    def parse(self):
        """Parse the Lua module."""
        self._extract_globals()
        self._extract_functions()
        self._extract_events()
        self._extract_examples()
        
    def _extract_globals(self):
        """Extract global variable declarations and exports."""
        # Patterns for global declarations
        patterns = [
            r'^\s*(\w+)\s*=\s*\{\}',  # myModule = {}
            r'^\s*(\w+)\s*=\s*class\(',  # MyClass = class(...)
            r'^\s*(\w+)\s*=\s*newclass\(',  # MyClass = newclass(...)
        ]
        
        for i, line in enumerate(self.lines):
            for pattern in patterns:
                match = re.match(pattern, line)
                if match:
                    name = match.group(1)
                    # Get comment above
                    comment = self._get_comment_above(i)
                    self.globals.append({
                        'name': name,
                        'brief': comment,
                        'line': i + 1
                    })
                    break
    
    def _extract_functions(self):
        """Extract function definitions."""
        # Patterns for functions
        patterns = [
            r'^\s*function\s+(\w+(?:\.\w+)*)\s*\(([^)]*)\)',  # function name(params)
            r'^\s*local\s+function\s+(\w+)\s*\(([^)]*)\)',  # local function name(params)
            r'^\s*(\w+(?:\.\w+)*)\s*=\s*function\s*\(([^)]*)\)',  # name = function(params)
        ]
        
        for i, line in enumerate(self.lines):
            for pattern in patterns:
                match = re.match(pattern, line)
                if match:
                    name = match.group(1)
                    params = match.group(2).strip() if len(match.groups()) > 1 else ""
                    
                    # Get comment above
                    comment = self._get_comment_above(i)
                    
                    # Try to extract @param and @return from comments
                    params_doc = self._extract_param_docs(comment, params)
                    returns_doc = self._extract_return_docs(comment)
                    
                    self.functions.append({
                        'name': name,
                        'params': params,
                        'params_doc': params_doc,
                        'returns': returns_doc,
                        'brief': comment,
                        'line': i + 1
                    })
                    break
    
    def _extract_events(self):
        """Extract event connections and callbacks."""
        # Patterns for events
        patterns = [
            r'connect\s*\(\s*([^,]+)',  # connect(event, ...)
            r'on(\w+)\s*\(',  # onSomething(...)
            r'addEvent\s*\(',  # addEvent(...)
            r'schedule\s*\(',  # schedule(...)
            r'g_ui\.(\w+)',  # g_ui.something
        ]
        
        for i, line in enumerate(self.lines):
            for pattern in patterns:
                match = re.search(pattern, line)
                if match:
                    event_name = match.group(1) if len(match.groups()) > 0 else 'event'
                    comment = self._get_comment_above(i)
                    
                    self.events.append({
                        'name': event_name,
                        'line_text': line.strip(),
                        'brief': comment,
                        'line': i + 1
                    })
                    break
    
    def _extract_examples(self):
        """Extract code examples from comments."""
        in_example = False
        current_example = []
        example_name = ""
        
        for i, line in enumerate(self.lines):
            stripped = line.strip()
            
            # Check for example start
            if '@example' in stripped.lower() or 'example:' in stripped.lower():
                in_example = True
                example_name = stripped
                current_example = []
                continue
            
            # Collect example lines
            if in_example:
                if stripped.startswith('--'):
                    # Still in comment
                    current_example.append(stripped[2:].strip())
                elif not stripped:
                    # Empty line - might be end
                    if current_example:
                        self.examples.append({
                            'name': example_name,
                            'code': '\n'.join(current_example),
                            'line': i + 1
                        })
                        in_example = False
                        current_example = []
                else:
                    # Non-comment line - end of example
                    if current_example:
                        self.examples.append({
                            'name': example_name,
                            'code': '\n'.join(current_example),
                            'line': i + 1
                        })
                    in_example = False
                    current_example = []
    
    def _get_comment_above(self, line_idx: int) -> str:
        """Get comment block above a line."""
        comments = []
        i = line_idx - 1
        
        while i >= 0:
            line = self.lines[i].strip()
            if line.startswith('--'):
                comments.insert(0, line[2:].strip())
            elif not line:
                i -= 1
                continue
            else:
                break
            i -= 1
        
        return ' '.join(comments).strip()
    
    def _extract_param_docs(self, comment: str, params: str) -> List[Dict]:
        """Extract parameter documentation from comments."""
        param_docs = []
        
        # Split params
        param_names = [p.strip() for p in params.split(',') if p.strip()]
        
        # Look for @param in comment
        for param_name in param_names:
            pattern = rf'@param\s+{re.escape(param_name)}\s+(.+?)(?:@|$)'
            match = re.search(pattern, comment, re.IGNORECASE)
            if match:
                param_docs.append({
                    'name': param_name,
                    'doc': match.group(1).strip()
                })
            else:
                param_docs.append({
                    'name': param_name,
                    'doc': ''
                })
        
        return param_docs
    
    def _extract_return_docs(self, comment: str) -> str:
        """Extract return documentation from comments."""
        match = re.search(r'@return\s+(.+?)(?:@|$)', comment, re.IGNORECASE)
        if match:
            return match.group(1).strip()
        
        # Also check for "returns:" pattern
        match = re.search(r'returns?:?\s+(.+?)(?:\.|$)', comment, re.IGNORECASE)
        if match:
            return match.group(1).strip()
        
        return ''


def generate_markdown(parser: LuaParser, source_path: str, rel_path: str, abs_path: Path) -> str:
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
    lines.append('doc_class: "spec"')
    lines.append('language: "pl"')
    lines.append(f'title: "Moduł Lua: {Path(source_path).name}"')
    lines.append(f'summary: "Dokumentacja modułu Lua dla {source_path}"')
    lines.append('tags: ["lua", "module", "otclient"]')
    lines.append('---')
    lines.append('')
    
    # Title
    lines.append(f'# {source_path}')
    lines.append('')
    
    # Overview
    lines.append('## Overview')
    lines.append('')
    lines.append(f'Moduł Lua zawierający funkcje i logikę dla {Path(source_path).stem}.')
    lines.append('')
    
    # Globals/Exports
    if parser.globals:
        lines.append('## Globals/Exports')
        lines.append('')
        for glob in parser.globals:
            lines.append(f'### `{glob["name"]}`')
            lines.append('')
            if glob['brief']:
                lines.append(glob['brief'])
                lines.append('')
    
    # Functions
    if parser.functions:
        lines.append('## Functions')
        lines.append('')
        for func in parser.functions:
            lines.append(f'### `{func["name"]}({func["params"]})`')
            lines.append('')
            if func['brief']:
                lines.append(func['brief'])
                lines.append('')
            
            # Parameters
            if func['params_doc']:
                lines.append('**Parametry:**')
                lines.append('')
                for param in func['params_doc']:
                    if param['doc']:
                        lines.append(f'- `{param["name"]}`: {param["doc"]}')
                    else:
                        lines.append(f'- `{param["name"]}`')
                lines.append('')
            
            # Returns
            if func['returns']:
                lines.append(f'**Zwraca:** {func["returns"]}')
                lines.append('')
    
    # Events/Callbacks
    if parser.events:
        lines.append('## Events/Callbacks')
        lines.append('')
        for event in parser.events:
            lines.append(f'### `{event["name"]}`')
            lines.append('')
            if event['brief']:
                lines.append(event['brief'])
                lines.append('')
            lines.append(f'**Wywołanie:** `{event["line_text"]}`')
            lines.append('')
    
    # Examples
    if parser.examples:
        lines.append('## Examples')
        lines.append('')
        for example in parser.examples:
            lines.append(f'### {example["name"]}')
            lines.append('')
            lines.append('```lua')
            lines.append(example['code'])
            lines.append('```')
            lines.append('')
    
    return '\n'.join(lines)


def process_lua_file(lua_path: Path, base_dir: Path):
    """Process a single Lua file."""
    # Calculate relative path
    rel_path = lua_path.relative_to(base_dir)
    source_path_str = str(rel_path).replace('\\', '/')
    
    # Read content
    try:
        content = lua_path.read_text(encoding='utf-8', errors='ignore')
    except Exception as e:
        print(f"Error reading {lua_path}: {e}", file=sys.stderr)
        return
    
    # Parse
    parser = LuaParser(content, lua_path)
    parser.parse()
    
    # Generate markdown
    markdown = generate_markdown(parser, source_path_str, str(rel_path), lua_path)
    
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


def main():
    """Main entry point."""
    import argparse
    
    parser = argparse.ArgumentParser(description='Generate Lua module documentation')
    parser.add_argument('--source-dirs', type=str, nargs='+', default=['modules', 'mods'],
                        help='Source directories to scan (default: modules mods)')
    args = parser.parse_args()
    
    lua_files = []
    
    for source_dir_name in args.source_dirs:
        source_dir = REPO_ROOT / source_dir_name
        if not source_dir.exists():
            print(f"Warning: {source_dir} does not exist, skipping", file=sys.stderr)
            continue
        
        # Find all Lua files
        lua_files.extend(source_dir.rglob('*.lua'))
    
    print(f"Found {len(lua_files)} Lua files")
    
    # Process each file
    for lua_path in sorted(lua_files):
        # Determine base directory
        if 'modules' in lua_path.parts:
            base_dir = REPO_ROOT / 'modules'
        elif 'mods' in lua_path.parts:
            base_dir = REPO_ROOT / 'mods'
        else:
            continue
        
        process_lua_file(lua_path, base_dir)
    
    print(f"\nCompleted! Documentation written to {DOCS_OUTPUT.relative_to(REPO_ROOT)}")


if __name__ == '__main__':
    main()
