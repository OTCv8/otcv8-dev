#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Analytics and Coverage Report Generator for OTClient v8 Documentation
"""

import os
import re
import csv
import json
from pathlib import Path
from typing import List, Dict, Tuple
from collections import defaultdict

# Repository root
REPO_ROOT = Path(__file__).resolve().parents[3]
DOCS_BASE = REPO_ROOT / "docs" / "reposzablony"
ANALYTICS_OUTPUT = DOCS_BASE / "analytics"


def extract_frontmatter(content: str) -> Dict:
    """Extract YAML frontmatter from markdown."""
    match = re.match(r'^---\s*\n(.*?)\n---\s*\n', content, re.DOTALL)
    if not match:
        return {}
    
    frontmatter = {}
    for line in match.group(1).split('\n'):
        if ':' in line:
            key, value = line.split(':', 1)
            key = key.strip()
            value = value.strip().strip('"').strip("'")
            frontmatter[key] = value
    
    return frontmatter


def generate_coverage():
    """Generate coverage report."""
    print("Generating coverage report...")
    
    records = []
    
    # Scan all MD files
    for md_file in DOCS_BASE.rglob('*.md'):
        if 'qa/' in str(md_file) or 'analytics/' in str(md_file):
            continue
        
        try:
            content = md_file.read_text(encoding='utf-8', errors='ignore')
            fm = extract_frontmatter(content)
            
            if not fm:
                continue
            
            # Count chunks (by H2-H4 headers)
            chunks = len(re.findall(r'^#{2,4}\s+', content, re.MULTILINE))
            
            # Count links
            links = len(re.findall(r'\[([^\]]+)\]\(([^)]+)\)', content))
            
            # Check for "See also" section
            see_also = 'see also' in content.lower()
            
            # Check for diagrams
            has_diagram = '.mmd' in content
            
            # Check if in datasets
            doc_id = fm.get('doc_id', '')
            in_datasets = False
            
            for dataset_file in (DOCS_BASE / 'datasets').glob('*.csv'):
                try:
                    with open(dataset_file, 'r', encoding='utf-8') as f:
                        if doc_id in f.read():
                            in_datasets = True
                            break
                except:
                    pass
            
            records.append({
                'source_path': fm.get('source_path', ''),
                'doc_path': str(md_file.relative_to(DOCS_BASE)),
                'doc_class': fm.get('doc_class', ''),
                'chunks': chunks,
                'links': links,
                'see_also': 'yes' if see_also else 'no',
                'has_diagram': 'yes' if has_diagram else 'no',
                'in_datasets': 'yes' if in_datasets else 'no',
                'last_sync_iso': fm.get('last_sync_iso', ''),
                'ok_frontmatter': 'yes' if all(k in fm for k in ['doc_id', 'source_path', 'doc_class']) else 'no'
            })
        except Exception:
            pass
    
    # Write CSV
    ANALYTICS_OUTPUT.mkdir(parents=True, exist_ok=True)
    csv_path = ANALYTICS_OUTPUT / 'coverage.csv'
    
    if records:
        with open(csv_path, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=list(records[0].keys()))
            writer.writeheader()
            writer.writerows(records)
        print(f"  Generated: {csv_path.relative_to(REPO_ROOT)} ({len(records)} files)")
    
    return records


def generate_gaps(coverage_records):
    """Generate gaps report."""
    print("Generating gaps report...")
    
    gaps = []
    
    # Check for missing elements
    for record in coverage_records:
        if record['ok_frontmatter'] == 'no':
            gaps.append({
                'source_path': record['source_path'],
                'reason': 'no_frontmatter',
                'details': 'Missing required frontmatter fields'
            })
        
        if record['in_datasets'] == 'no':
            gaps.append({
                'source_path': record['source_path'],
                'reason': 'no_dataset',
                'details': 'Not found in any dataset'
            })
        
        if record['links'] == 0:
            gaps.append({
                'source_path': record['source_path'],
                'reason': 'no_links',
                'details': 'No internal links found'
            })
    
    # Write CSV
    csv_path = ANALYTICS_OUTPUT / 'gaps.csv'
    
    if gaps:
        with open(csv_path, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=['source_path', 'reason', 'details'])
            writer.writeheader()
            writer.writerows(gaps)
        print(f"  Generated: {csv_path.relative_to(REPO_ROOT)} ({len(gaps)} gaps)")
    else:
        with open(csv_path, 'w', newline='', encoding='utf-8') as f:
            f.write('source_path,reason,details\n')
            f.write('OK,no_gaps,No gaps found\n')
        print(f"  Generated: {csv_path.relative_to(REPO_ROOT)} (0 gaps)")
    
    return gaps


def generate_xref_stats():
    """Generate cross-reference statistics."""
    print("Generating xref stats...")
    
    relations_file = DOCS_BASE / 'relations' / 'relations.csv'
    stats = defaultdict(int)
    
    if relations_file.exists():
        with open(relations_file, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                rel_type = row.get('rel_type', 'unknown')
                stats[rel_type] += 1
    
    # Write CSV
    csv_path = ANALYTICS_OUTPUT / 'xref_stats.csv'
    
    with open(csv_path, 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['rel_type', 'count'])
        
        if stats:
            for rel_type, count in sorted(stats.items()):
                writer.writerow([rel_type, count])
        else:
            writer.writerow(['N/A', 0])
    
    print(f"  Generated: {csv_path.relative_to(REPO_ROOT)}")
    
    return stats


def generate_coverage_matrix(coverage_records):
    """Generate coverage matrix."""
    print("Generating coverage matrix...")
    
    # Group by module
    modules = defaultdict(lambda: {
        'api': 0, 'lua': 0, 'otui': 0, 'events': 0, 'diagrams': 0, 'datasets': 0
    })
    
    for record in coverage_records:
        source_path = record['source_path']
        if '/' in source_path:
            module = source_path.split('/')[0]
        else:
            module = 'root'
        
        doc_class = record['doc_class']
        
        if doc_class == 'api':
            modules[module]['api'] += 1
        elif doc_class == 'spec':
            modules[module]['lua'] += 1
        elif doc_class == 'ui':
            modules[module]['otui'] += 1
        
        if record['has_diagram'] == 'yes':
            modules[module]['diagrams'] += 1
        
        if record['in_datasets'] == 'yes':
            modules[module]['datasets'] += 1
    
    # Generate markdown table
    lines = []
    lines.append('# Coverage Matrix')
    lines.append('')
    lines.append('Macierz pokrycia dokumentacją dla poszczególnych modułów.')
    lines.append('')
    lines.append('| Module | API | Lua | OTUI | Events | Diagrams | Datasets |')
    lines.append('|--------|-----|-----|------|--------|----------|----------|')
    
    for module in sorted(modules.keys()):
        stats = modules[module]
        lines.append(f'| {module} | {stats["api"]} | {stats["lua"]} | {stats["otui"]} | {stats["events"]} | {stats["diagrams"]} | {stats["datasets"]} |')
    
    lines.append('')
    
    # Write markdown
    md_path = ANALYTICS_OUTPUT / 'coverage_matrix.md'
    md_path.write_text('\n'.join(lines), encoding='utf-8', newline='\n')
    print(f"  Generated: {md_path.relative_to(REPO_ROOT)}")


def generate_overview_diagram(coverage_records):
    """Generate overview Mermaid diagram."""
    print("Generating overview diagram...")
    
    # Count by type
    api_count = sum(1 for r in coverage_records if r['doc_class'] == 'api')
    lua_count = sum(1 for r in coverage_records if r['doc_class'] == 'spec')
    ui_count = sum(1 for r in coverage_records if r['doc_class'] == 'ui')
    
    lines = []
    lines.append('graph TD')
    lines.append('    Root[OTClient v8 Docs]')
    lines.append(f'    API[C++ API<br/>{api_count} files]')
    lines.append(f'    Lua[Lua Modules<br/>{lua_count} files]')
    lines.append(f'    UI[OTUI Widgets<br/>{ui_count} files]')
    lines.append('    Events[Events/Emitters]')
    lines.append('    Datasets[RAG Datasets]')
    lines.append('    ')
    lines.append('    Root --> API')
    lines.append('    Root --> Lua')
    lines.append('    Root --> UI')
    lines.append('    Root --> Events')
    lines.append('    Root --> Datasets')
    lines.append('    ')
    lines.append('    API --> Datasets')
    lines.append('    Lua --> Datasets')
    lines.append('    UI --> Datasets')
    lines.append('    Events --> Datasets')
    
    # Write diagram
    mmd_path = ANALYTICS_OUTPUT / 'overview.mmd'
    mmd_path.write_text('\n'.join(lines), encoding='utf-8', newline='\n')
    print(f"  Generated: {mmd_path.relative_to(REPO_ROOT)}")


def generate_run_summary(coverage_records):
    """Generate run summary JSON."""
    print("Generating run summary...")
    
    # Count files
    total_md = len(coverage_records)
    total_api = sum(1 for r in coverage_records if r['doc_class'] == 'api')
    total_lua = sum(1 for r in coverage_records if r['doc_class'] == 'spec')
    total_ui = sum(1 for r in coverage_records if r['doc_class'] == 'ui')
    
    # Count chunks
    total_chunks = sum(r['chunks'] for r in coverage_records)
    
    # Count links
    total_links = sum(r['links'] for r in coverage_records)
    
    # Count with datasets
    in_datasets = sum(1 for r in coverage_records if r['in_datasets'] == 'yes')
    
    # Count diagrams
    diagrams = sum(1 for r in coverage_records if r['has_diagram'] == 'yes')
    
    # Dataset sizes
    datasets_bytes = 0
    for ds_file in (DOCS_BASE / 'datasets').glob('*'):
        if ds_file.is_file():
            datasets_bytes += ds_file.stat().st_size
    
    # Events count
    events_file = DOCS_BASE / 'datasets' / 'events.csv'
    events_count = 0
    if events_file.exists():
        with open(events_file, 'r', encoding='utf-8') as f:
            events_count = sum(1 for _ in f) - 1  # Minus header
    
    summary = {
        'total_files': total_md,
        'total_docs': {
            'api': total_api,
            'lua': total_lua,
            'ui': total_ui
        },
        'total_chunks': total_chunks,
        'total_links': total_links,
        'broken_links': 0,  # Would need link checker
        'in_datasets': in_datasets,
        'diagrams': diagrams,
        'datasets_bytes': datasets_bytes,
        'events_count': events_count,
        'generated_at': __import__('datetime').datetime.now(__import__('datetime').timezone.utc).isoformat()
    }
    
    # Write JSON
    json_path = ANALYTICS_OUTPUT / 'run_summary.json'
    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(summary, f, indent=2, ensure_ascii=False)
    
    print(f"  Generated: {json_path.relative_to(REPO_ROOT)}")
    
    return summary


def generate_errors_report():
    """Generate errors report from QA."""
    print("Generating errors report...")
    
    lines = []
    lines.append('# Errors and Warnings')
    lines.append('')
    lines.append('Zbiorczy raport błędów i ostrzeżeń z procesu generacji dokumentacji.')
    lines.append('')
    
    # Check QA reports
    qa_dir = DOCS_BASE / 'qa'
    
    if qa_dir.exists():
        # Frontmatter issues
        fm_issues = qa_dir / 'frontmatter_issues.csv'
        if fm_issues.exists():
            with open(fm_issues, 'r', encoding='utf-8') as f:
                lines.append('## Frontmatter Issues')
                lines.append('')
                lines.append('```')
                lines.append(f.read())
                lines.append('```')
                lines.append('')
        
        # Link issues
        link_issues = qa_dir / 'link_lint.csv'
        if link_issues.exists():
            with open(link_issues, 'r', encoding='utf-8') as f:
                content = f.read()
                if 'BROKEN' in content:
                    lines.append('## Broken Links')
                    lines.append('')
                    lines.append('```')
                    lines.append(content[:1000])  # First 1000 chars
                    lines.append('```')
                    lines.append('')
    
    # Write report
    md_path = ANALYTICS_OUTPUT / 'errors.md'
    md_path.write_text('\n'.join(lines), encoding='utf-8', newline='\n')
    print(f"  Generated: {md_path.relative_to(REPO_ROOT)}")


def main():
    """Main entry point."""
    print("Generating analytics and reports...\n")
    
    # Generate all reports
    coverage = generate_coverage()
    gaps = generate_gaps(coverage)
    xref_stats = generate_xref_stats()
    generate_coverage_matrix(coverage)
    generate_overview_diagram(coverage)
    summary = generate_run_summary(coverage)
    generate_errors_report()
    
    print(f"\nCompleted! Analytics reports generated in {ANALYTICS_OUTPUT.relative_to(REPO_ROOT)}")
    print(f"\nSummary: {summary['total_files']} files, {summary['total_chunks']} chunks, {summary['events_count']} events")


if __name__ == '__main__':
    main()
