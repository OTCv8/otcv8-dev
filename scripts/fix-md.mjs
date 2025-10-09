// Auto-fix docs/**/*.md
import fs from "fs/promises";
import { glob } from "glob";

const files = await glob("docs/**/*.md", { nodir: true, ignore: ["docs/build/**", "site/**"] });

for (const f of files) {
  let t = await fs.readFile(f, "utf8");
  t = t.replace(/\r\n/g, "\n");
  t = t.replace(/[ \t]+$/gm, "");
  t = t.replace(/\t/g, "  ");
  t = t.replace(/[“”]/g, '"').replace(/[‘’]/g, "'");
  t = t.replace(/(^#{1,6} .*)(?!\n\n)/gm, "$1\n");
  t = t.replace(/(^|\n)!!! +([a-z]+)([^\n]*)\n(?!\n)/gi, (_m, a, b, c) => `${a}!!! ${b}${c}\n\n`);
  if ((t.match(/```/g) || []).length % 2 === 1) t += "\n```\n";
  t = t.replace(/(^|\n)``` *mermaid( *\n)?/g, "\n```mermaid\n");
  t = t.replace(/(^|\n)``` *otui( *\n)?/g, "\n```otui\n");
  t = t.replace(/([^\n])\n```/g, "$1\n\n```");
  t = t.replace(/```\n([^\n])/g, "```\n\n$1");
  await fs.writeFile(f, t);
  console.log("fixed:", f);
}
