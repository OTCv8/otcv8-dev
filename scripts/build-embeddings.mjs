// Generuje embeddings bez API → zapis do docs/rag/embeddings.json
// Czyści markdown (code blocks, mermaid), dodaje title i URL.
import { pipeline } from '@xenova/transformers';
import { glob } from 'glob';
import fs from 'fs/promises';

const SITE_BASE = 'https://lukaszj321.github.io/otcv8-dev/';

// --- utils ---
const stripFrontMatter = (t) => t.replace(/^---[\s\S]*?---\n/, '');
const stripCodeBlocks = (t) => t.replace(/```[\s\S]*?```/g, ' ');
const stripInlineCode  = (t) => t.replace(/`[^`]*`/g, ' ');
const stripImages      = (t) => t.replace(/!\[[^\]]*\]\([^)]+\)/g, ' ');
const stripLinks       = (t) => t.replace(/\[([^\]]+)\]\(([^)]+)\)/g, '$1');
const stripMdSyntax    = (t) => t
  .replace(/^>+\s?/gm, ' ')
  .replace(/^#{1,6}\s*/gm, '')
  .replace(/[*_~>]/g, ' ')
  .replace(/\s+/g, ' ')
  .trim();

function mdToCleanText(md) {
  let s = stripFrontMatter(md);
  s = stripCodeBlocks(s);
  s = stripInlineCode(s);
  s = stripImages(s);
  s = stripLinks(s);
  s = stripMdSyntax(s);
  return s;
}

function firstTitle(md, fallback) {
  const m = md.match(/^#\s+(.+)$/m);
  return m ? m[1].trim() : fallback;
}

function pathToUrl(p) {
  const rel = p.replace(/^docs\//, '').replace(/\.md$/, '/');
  return SITE_BASE + rel;
}

function chunkWithOverlap(s, size = 1200, overlap = 200) {
  const out = [];
  for (let i = 0; i < s.length; i += (size - overlap)) out.push(s.slice(i, i + size));
  return out;
}

// --- main ---
const files = await glob('docs/**/*.md', { ignore: ['docs/rag/**'] });
const extractor = await pipeline('feature-extraction', 'Xenova/all-MiniLM-L6-v2');

const rows = [];
for (const path of files) {
  const raw = await fs.readFile(path, 'utf8');
  const clean = mdToCleanText(raw);
  const title = firstTitle(raw, path.split('/').pop().replace(/\.md$/, ''));
  const chunks = chunkWithOverlap(clean);
  for (let idx = 0; idx < chunks.length; idx++) {
    const text = chunks[idx];
    if (!text.trim()) continue;
    const emb = await extractor(text, { pooling: 'mean', normalize: true });
    rows.push({ path, url: pathToUrl(path), title, idx, text, embedding: Array.from(emb.data) });
  }
}

await fs.mkdir('docs/rag', { recursive: true });
await fs.writeFile('docs/rag/embeddings.json', JSON.stringify(rows));
console.log('OK -> docs/rag/embeddings.json | chunks:', rows.length);
