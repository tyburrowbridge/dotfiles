#!/usr/bin/env node
const chunks = [];
process.stdin.on("data", d => chunks.push(d.toString()));
process.stdin.on("end", () => {
  try {
    process.stdout.write("");
  } catch {}
});
