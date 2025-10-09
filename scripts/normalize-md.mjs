#!/usr/bin/env node
// Sklejanie połamanych nagłówków/akapity przed Pandoc (DOCX/EPUB)
import fs from "fs";
const f = process.argv[2];
if (!f) { console.error("Użycie: node scripts/normalize-md.mjs IN.md"); process.exit(1); }
let t = fs.readFileSync(f, "utf8");

// pojedyncze litery w pionie → sklej
t = t.replace(/(^|\n)([A-Za-zĄąĆćĘęŁłŃńÓóŚśŻżŹź])\n(?=[A-Za-zĄąĆćĘęŁłŃńÓóŚśŻżŹź](\n|$))/g, "$1$2");
// miękkie zawijanie → spacje (poza pustą linią)
t = t.replace(/([^\s])\n(?!\n|```)/g, "$1 ");

// domknij fence, jeśli nieparzysty
if (((t.match(/```/g)||[]).length % 2)===1) t += "\n```\n";

fs.writeFileSync(f, t, "utf8");
console.log("normalize-md: OK");
