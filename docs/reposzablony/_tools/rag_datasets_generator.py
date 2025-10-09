#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
RAG Datasets Generator for OTClient v8
Generates CSV and NDJSON datasets from markdown documentation.
"""

import os
import re
import sys
import csv
import json
import hashlib
from pathlib import Path
from datetime import datetime, timezone
from typing import List, Dict, Optional

# Repository root
REPO_ROOT = Path(__file__).resolve().parents[3]
DOCS_BASE = REPO_ROOT / "docs" / "reposzablony"
DATASETS_OUTPUT = DOCS_BASE / "datasets"


def extract_frontmatter(content: str) -> Optional[Dict]:
    """Extract YAML frontmatter from markdown."""
    match = re.match(r'^---\s*\n(.*?)\n---\s*\n', content, re.DOTALL)
    if not match:
        return None
    
    frontmatter = {}
    for line in match.group(1).split('\n'):
        if ':' in line:
            key, value = line.split(':', 1)
            key = key.strip()
            value = value.strip().strip('"').strip("'")
            frontmatter[key] = value
    
    return frontmatter


def chunk_markdown(content: str, max_tokens: int = 1200) -> List[str]:
    """Chunk markdown content by headers."""
    # Remove frontmatter
    content = re.sub(r'^---\s*\n.*?\n---\s*\n', '', content, flags=re.DOTALL)
    
    chunks = []
    current_chunk = []
    current_size = 0
    
    lines = content.split('\n')
    
    for line in lines:
        # Estimate tokens (rough: 4 chars = 1 token)
        line_tokens = len(line) // 4
        
        # Check if this is a header H2-H4
        if re.match(r'^#{2,4}\s', line):
            if current_chunk and current_size > 0:
                chunks.append('\n'.join(current_chunk))
                # Add overlap (last 10% of previous chunk)
                overlap_size = int(len(current_chunk) * 0.1)
                current_chunk = current_chunk[-overlap_size:] if overlap_size > 0 else []
                current_size = sum(len(l) // 4 for l in current_chunk)
        
        current_chunk.append(line)
        current_size += line_tokens
        
        # If chunk is getting too large, split
        if current_size >= max_tokens:
            chunks.append('\n'.join(current_chunk))
            # Overlap
            overlap_size = int(len(current_chunk) * 0.1)
            current_chunk = current_chunk[-overlap_size:] if overlap_size > 0 else []
            current_size = sum(len(l) // 4 for l in current_chunk)
    
    # Add remaining
    if current_chunk:
        chunks.append('\n'.join(current_chunk))
    
    return chunks


def process_api_docs():
    """Process C++ API documentation into datasets."""
    api_dir = DOCS_BASE / "01_core" / "api" / "cpp"
    if not api_dir.exists():
        return []
    
    records = []
    
    for md_file in api_dir.rglob('*.md'):
        content = md_file.read_text(encoding='utf-8', errors='ignore')
        frontmatter = extract_frontmatter(content)
        
        if not frontmatter or frontmatter.get('doc_class') != 'api':
            continue
        
        chunks = chunk_markdown(content)
        
        for idx, chunk in enumerate(chunks):
            record = {
                'doc_id': frontmatter.get('doc_id', ''),
                'source_path': frontmatter.get('source_path', ''),
                'source_sha': frontmatter.get('source_sha', ''),
                'chunk_id': f"{frontmatter.get('doc_id', '')}_{idx}",
                'chunk_index': idx,
                'chunk_count': len(chunks),
                'doc_class': 'api',
                'language': 'cpp',
                'content': chunk[:500],  # Limit for CSV
                'content_full': chunk,
                'last_sync_iso': frontmatter.get('last_sync_iso', ''),
            }
            records.append(record)
    
    return records


def process_ui_docs():
    """Process OTUI documentation into datasets."""
    ui_dir = DOCS_BASE / "04_ui" / "otui"
    if not ui_dir.exists():
        return []
    
    records = []
    
    for md_file in ui_dir.rglob('*.md'):
        content = md_file.read_text(encoding='utf-8', errors='ignore')
        frontmatter = extract_frontmatter(content)
        
        if not frontmatter or frontmatter.get('doc_class') != 'ui':
            continue
        
        chunks = chunk_markdown(content)
        
        for idx, chunk in enumerate(chunks):
            record = {
                'doc_id': frontmatter.get('doc_id', ''),
                'source_path': frontmatter.get('source_path', ''),
                'source_sha': frontmatter.get('source_sha', ''),
                'chunk_id': f"{frontmatter.get('doc_id', '')}_{idx}",
                'chunk_index': idx,
                'chunk_count': len(chunks),
                'doc_class': 'ui',
                'language': 'otui',
                'content': chunk[:500],
                'content_full': chunk,
                'last_sync_iso': frontmatter.get('last_sync_iso', ''),
            }
            records.append(record)
    
    return records


def process_modules_docs():
    """Process Lua module documentation into datasets."""
    modules_dir = DOCS_BASE / "03_modules" / "lua"
    if not modules_dir.exists():
        return []
    
    records = []
    
    for md_file in modules_dir.rglob('*.md'):
        content = md_file.read_text(encoding='utf-8', errors='ignore')
        frontmatter = extract_frontmatter(content)
        
        if not frontmatter or frontmatter.get('doc_class') != 'spec':
            continue
        
        chunks = chunk_markdown(content)
        
        for idx, chunk in enumerate(chunks):
            record = {
                'doc_id': frontmatter.get('doc_id', ''),
                'source_path': frontmatter.get('source_path', ''),
                'source_sha': frontmatter.get('source_sha', ''),
                'chunk_id': f"{frontmatter.get('doc_id', '')}_{idx}",
                'chunk_index': idx,
                'chunk_count': len(chunks),
                'doc_class': 'spec',
                'language': 'lua',
                'content': chunk[:500],
                'content_full': chunk,
                'last_sync_iso': frontmatter.get('last_sync_iso', ''),
            }
            records.append(record)
    
    return records


def write_dataset(records: List[Dict], name: str):
    """Write dataset to CSV and NDJSON."""
    if not records:
        print(f"No records for {name}, skipping")
        return
    
    DATASETS_OUTPUT.mkdir(parents=True, exist_ok=True)
    
    # CSV (without content_full to keep size down)
    csv_path = DATASETS_OUTPUT / f"{name}.csv"
    csv_fields = ['doc_id', 'source_path', 'source_sha', 'chunk_id', 'chunk_index', 'chunk_count', 'doc_class', 'language', 'content', 'last_sync_iso']
    
    with open(csv_path, 'w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=csv_fields)
        writer.writeheader()
        for record in records:
            row = {k: record[k] for k in csv_fields if k in record}
            writer.writerow(row)
    
    print(f"Generated: {csv_path.relative_to(REPO_ROOT)} ({len(records)} records)")
    
    # NDJSON (with full content)
    ndjson_path = DATASETS_OUTPUT / f"{name}.ndjson"
    with open(ndjson_path, 'w', encoding='utf-8') as f:
        for record in records:
            f.write(json.dumps(record, ensure_ascii=False) + '\n')
    
    print(f"Generated: {ndjson_path.relative_to(REPO_ROOT)}")
    
    # Check size for rotation
    csv_size = csv_path.stat().st_size
    ndjson_size = ndjson_path.stat().st_size
    
    max_bytes = 50 * 1024 * 1024  # 50MB
    
    if csv_size > max_bytes or ndjson_size > max_bytes:
        print(f"  WARNING: Dataset {name} exceeds 50MB, rotation recommended")
        # Create chunks directory
        chunks_dir = DATASETS_OUTPUT / "chunks"
        chunks_dir.mkdir(exist_ok=True)
        print(f"  Chunks directory ready: {chunks_dir.relative_to(REPO_ROOT)}")


def main():
    """Main entry point."""
    print("Generating RAG datasets...")
    
    # Process each documentation type
    print("\n1. Processing API docs...")
    api_records = process_api_docs()
    write_dataset(api_records, 'api')
    
    print("\n2. Processing UI docs...")
    ui_records = process_ui_docs()
    write_dataset(ui_records, 'ui')
    
    print("\n3. Processing Modules docs...")
    modules_records = process_modules_docs()
    write_dataset(modules_records, 'modules')
    
    print(f"\nCompleted! Generated datasets in {DATASETS_OUTPUT.relative_to(REPO_ROOT)}")
    print(f"Total records: API={len(api_records)}, UI={len(ui_records)}, Modules={len(modules_records)}")


if __name__ == '__main__':
    main()
