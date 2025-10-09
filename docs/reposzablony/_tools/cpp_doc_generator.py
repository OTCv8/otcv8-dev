#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
C++ API Documentation Generator for OTClient v8
Generates Markdown documentation with frontmatter from C++ headers.
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
DOCS_OUTPUT = REPO_ROOT / "docs" / "reposzablony" / "01_core" / "api" / "cpp"
DIAGRAMS_OUTPUT = REPO_ROOT / "docs" / "reposzablony" / "01_core" / "api" / "diagrams"


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
    return f"cpp-api-{hash_obj.hexdigest()[:12]}"


def extract_comments(lines: List[str], start_idx: int) -> str:
    """Extract /// or /** */ comments before a declaration."""
    comments = []
    i = start_idx - 1
    
    # Look backwards for comments
    while i >= 0:
        line = lines[i].strip()
        if line.startswith('///'):
            comments.insert(0, line[3:].strip())
        elif '*/' in line:
            # Multi-line comment - collect backwards
            block = []
            while i >= 0 and '/*' not in lines[i]:
                block.insert(0, lines[i].strip())
                i -= 1
            if i >= 0:
                block.insert(0, lines[i].strip())
            # Clean up comment block
            comment_text = ' '.join(block)
            comment_text = re.sub(r'/\*\*?|\*/', '', comment_text)
            comment_text = re.sub(r'^\s*\*\s*', '', comment_text, flags=re.MULTILINE)
            comments.insert(0, comment_text.strip())
            break
        elif line and not line.startswith('//'):
            break
        i -= 1
    
    return ' '.join(comments).strip()


class CppParser:
    """Simple C++ header parser."""
    
    def __init__(self, content: str, file_path: Path):
        self.content = content
        self.lines = content.split('\n')
        self.file_path = file_path
        self.namespaces = []
        self.classes = []
        self.enums = []
        self.functions = []
        self.typedefs = []
        
    def parse(self):
        """Parse the C++ header."""
        self._extract_namespaces()
        self._extract_classes()
        self._extract_enums()
        self._extract_functions()
        self._extract_typedefs()
        
    def _extract_namespaces(self):
        """Extract namespace declarations."""
        pattern = r'^\s*namespace\s+(\w+)'
        for i, line in enumerate(self.lines):
            match = re.match(pattern, line)
            if match:
                ns_name = match.group(1)
                comment = extract_comments(self.lines, i)
                self.namespaces.append({
                    'name': ns_name,
                    'brief': comment,
                    'line': i + 1
                })
    
    def _extract_classes(self):
        """Extract class and struct declarations."""
        # Match class/struct with optional template
        i = 0
        while i < len(self.lines):
            line = self.lines[i].strip()
            
            # Check for template
            template_line = ""
            if line.startswith('template'):
                template_line = line
                i += 1
                if i >= len(self.lines):
                    break
                line = self.lines[i].strip()
            
            # Match class or struct
            match = re.match(r'^(class|struct)\s+(\w+)', line)
            if match:
                kind = match.group(1)
                name = match.group(2)
                comment = extract_comments(self.lines, i - (1 if template_line else 0))
                
                # Extract members
                members = self._extract_class_members(i + 1)
                
                self.classes.append({
                    'kind': kind,
                    'name': name,
                    'template': template_line,
                    'brief': comment,
                    'members': members,
                    'line': i + 1
                })
            i += 1
    
    def _extract_class_members(self, start_idx: int) -> List[Dict]:
        """Extract public/protected members of a class."""
        members = []
        current_access = 'private'
        brace_count = 0
        in_class = False
        
        for i in range(start_idx, len(self.lines)):
            line = self.lines[i].strip()
            
            # Track braces
            if '{' in line:
                brace_count += line.count('{')
                in_class = True
            if '}' in line:
                brace_count -= line.count('}')
                if brace_count <= 0:
                    break
            
            if not in_class:
                continue
            
            # Track access specifiers
            if re.match(r'^(public|protected|private):', line):
                current_access = line.split(':')[0]
                continue
            
            # Skip private members
            if current_access == 'private':
                continue
            
            # Extract methods and fields
            # Methods: return_type name(params)
            method_match = re.match(
                r'^(?:virtual\s+)?(?:static\s+)?(?:inline\s+)?([\w:]+(?:<[^>]+>)?)\s+(\w+)\s*\([^)]*\)',
                line
            )
            if method_match:
                comment = extract_comments(self.lines, i)
                members.append({
                    'type': 'method',
                    'access': current_access,
                    'signature': line.rstrip(';'),
                    'name': method_match.group(2),
                    'brief': comment
                })
                continue
            
            # Fields: type name;
            field_match = re.match(r'^([\w:]+(?:<[^>]+>)?)\s+(\w+)\s*[;=]', line)
            if field_match and not line.startswith('//'):
                comment = extract_comments(self.lines, i)
                members.append({
                    'type': 'field',
                    'access': current_access,
                    'signature': line.rstrip(';'),
                    'name': field_match.group(2),
                    'brief': comment
                })
        
        return members
    
    def _extract_enums(self):
        """Extract enum declarations."""
        i = 0
        while i < len(self.lines):
            line = self.lines[i].strip()
            match = re.match(r'^enum\s+(?:class\s+)?(\w+)', line)
            if match:
                name = match.group(1)
                comment = extract_comments(self.lines, i)
                
                # Extract enum values
                values = []
                j = i + 1
                while j < len(self.lines) and '}' not in self.lines[j]:
                    val_line = self.lines[j].strip()
                    val_match = re.match(r'^(\w+)\s*[=,]?', val_line)
                    if val_match and not val_line.startswith('//'):
                        values.append(val_match.group(1))
                    j += 1
                
                self.enums.append({
                    'name': name,
                    'brief': comment,
                    'values': values,
                    'line': i + 1
                })
            i += 1
    
    def _extract_functions(self):
        """Extract standalone function declarations."""
        for i, line in enumerate(self.lines):
            line_stripped = line.strip()
            # Skip class members, we already got those
            if line_stripped.startswith('class ') or line_stripped.startswith('struct '):
                continue
            
            # Match function signature
            match = re.match(
                r'^(?:inline\s+)?(?:static\s+)?([\w:]+(?:<[^>]+>)?)\s+(\w+)\s*\([^)]*\)',
                line_stripped
            )
            if match and not line_stripped.startswith('//'):
                comment = extract_comments(self.lines, i)
                self.functions.append({
                    'signature': line_stripped.rstrip(';'),
                    'name': match.group(2),
                    'brief': comment,
                    'line': i + 1
                })
    
    def _extract_typedefs(self):
        """Extract typedef and using declarations."""
        for i, line in enumerate(self.lines):
            line_stripped = line.strip()
            
            # typedef
            typedef_match = re.match(r'^typedef\s+(.+?)\s+(\w+)\s*;', line_stripped)
            if typedef_match:
                comment = extract_comments(self.lines, i)
                self.typedefs.append({
                    'kind': 'typedef',
                    'type': typedef_match.group(1),
                    'name': typedef_match.group(2),
                    'brief': comment,
                    'line': i + 1
                })
                continue
            
            # using
            using_match = re.match(r'^using\s+(\w+)\s*=\s*(.+?)\s*;', line_stripped)
            if using_match:
                comment = extract_comments(self.lines, i)
                self.typedefs.append({
                    'kind': 'using',
                    'name': using_match.group(1),
                    'type': using_match.group(2),
                    'brief': comment,
                    'line': i + 1
                })


def generate_markdown(parser: CppParser, source_path: str, rel_path: str, abs_path: Path) -> str:
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
    lines.append('doc_class: "api"')
    lines.append('language: "pl"')
    lines.append(f'title: "API: {Path(source_path).name}"')
    lines.append(f'summary: "Dokumentacja API C++ dla {source_path}"')
    lines.append('tags: ["cpp", "api", "otclient"]')
    lines.append('---')
    lines.append('')
    
    # Title
    lines.append(f'# {source_path}')
    lines.append('')
    
    # Overview
    lines.append('## Overview')
    lines.append('')
    lines.append(f'Plik nagłówkowy C++ zawierający definicje dla modułu {Path(source_path).stem}.')
    lines.append('')
    
    # Namespaces
    if parser.namespaces:
        lines.append('## Namespaces')
        lines.append('')
        for ns in parser.namespaces:
            lines.append(f'### `{ns["name"]}`')
            if ns['brief']:
                lines.append('')
                lines.append(ns['brief'])
            lines.append('')
    
    # Classes/Structs
    if parser.classes:
        lines.append('## Classes/Structs')
        lines.append('')
        for cls in parser.classes:
            kind_label = 'Klasa' if cls['kind'] == 'class' else 'Struktura'
            lines.append(f'### {kind_label}: `{cls["name"]}`')
            lines.append('')
            if cls['template']:
                lines.append(f'**Szablon:** `{cls["template"]}`')
                lines.append('')
            if cls['brief']:
                lines.append(cls['brief'])
                lines.append('')
            
            # Members table
            if cls['members']:
                lines.append('| Member | Brief | Signature |')
                lines.append('|--------|-------|-----------|')
                for member in cls['members']:
                    name = member.get('name', '')
                    brief = member.get('brief', '').replace('|', '\\|')[:100]
                    sig = member.get('signature', '').replace('|', '\\|')[:150]
                    lines.append(f'| `{name}` | {brief} | `{sig}` |')
                lines.append('')
    
    # Enums
    if parser.enums:
        lines.append('## Enums')
        lines.append('')
        for enum in parser.enums:
            lines.append(f'### `{enum["name"]}`')
            lines.append('')
            if enum['brief']:
                lines.append(enum['brief'])
                lines.append('')
            if enum['values']:
                lines.append('**Wartości:**')
                lines.append('')
                for val in enum['values']:
                    lines.append(f'- `{val}`')
                lines.append('')
    
    # Functions
    if parser.functions:
        lines.append('## Functions')
        lines.append('')
        for func in parser.functions:
            lines.append(f'### `{func["name"]}`')
            lines.append('')
            if func['brief']:
                lines.append(func['brief'])
                lines.append('')
            lines.append(f'**Sygnatura:** `{func["signature"]}`')
            lines.append('')
    
    # Types/Aliases
    if parser.typedefs:
        lines.append('## Types/Aliases')
        lines.append('')
        for td in parser.typedefs:
            lines.append(f'### `{td["name"]}`')
            lines.append('')
            if td['brief']:
                lines.append(td['brief'])
                lines.append('')
            lines.append(f'**{td["kind"].capitalize()}:** `{td["type"]}`')
            lines.append('')
    
    # Class diagram
    if parser.classes:
        lines.append('## Class Diagram')
        lines.append('')
        diagram_rel_path = f"../diagrams/{Path(rel_path).stem}.mmd"
        lines.append(f'Zobacz: [{diagram_rel_path}]({diagram_rel_path})')
        lines.append('')
    
    return '\n'.join(lines)


def generate_class_diagram(parser: CppParser, rel_path: str) -> Optional[str]:
    """Generate Mermaid class diagram."""
    if not parser.classes:
        return None
    
    lines = ['classDiagram']
    
    for cls in parser.classes:
        class_name = cls['name']
        
        # Class definition
        lines.append(f'    class {class_name} {{')
        
        # Add members (limit to avoid huge diagrams)
        member_count = 0
        for member in cls['members'][:20]:  # Limit to 20 members
            if member['access'] == 'public':
                prefix = '+'
            elif member['access'] == 'protected':
                prefix = '#'
            else:
                prefix = '-'
            
            if member['type'] == 'method':
                lines.append(f'        {prefix}{member["name"]}()')
            else:
                lines.append(f'        {prefix}{member["name"]}')
            member_count += 1
        
        if len(cls['members']) > 20:
            lines.append(f'        ... ({len(cls["members"]) - 20} more members)')
        
        lines.append('    }')
    
    # Limit diagram size
    if len(lines) > 80:
        return None  # Too large, skip
    
    return '\n'.join(lines)


def process_header_file(header_path: Path, base_dir: Path):
    """Process a single C++ header file."""
    # Calculate relative path
    rel_path = header_path.relative_to(base_dir)
    source_path_str = str(rel_path).replace('\\', '/')
    
    # Read content
    try:
        content = header_path.read_text(encoding='utf-8', errors='ignore')
    except Exception as e:
        print(f"Error reading {header_path}: {e}", file=sys.stderr)
        return
    
    # Parse
    parser = CppParser(content, header_path)
    parser.parse()
    
    # Generate markdown
    markdown = generate_markdown(parser, source_path_str, str(rel_path), header_path)
    
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
    diagram = generate_class_diagram(parser, str(rel_path))
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
    
    parser = argparse.ArgumentParser(description='Generate C++ API documentation')
    parser.add_argument('--source-dir', type=str, default='src',
                        help='Source directory to scan (default: src)')
    args = parser.parse_args()
    
    source_dir = REPO_ROOT / args.source_dir
    if not source_dir.exists():
        print(f"Error: {source_dir} does not exist", file=sys.stderr)
        sys.exit(1)
    
    # Find all header files
    header_files = []
    for ext in ['*.h', '*.hpp', '*.hxx']:
        header_files.extend(source_dir.rglob(ext))
    
    print(f"Found {len(header_files)} header files in {source_dir}")
    
    # Process each file
    for header_path in sorted(header_files):
        process_header_file(header_path, source_dir)
    
    print(f"\nCompleted! Documentation written to {DOCS_OUTPUT.relative_to(REPO_ROOT)}")


if __name__ == '__main__':
    main()
