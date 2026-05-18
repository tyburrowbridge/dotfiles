#!/usr/bin/env node
const chunks = [];
process.stdin.on('data', d => chunks.push(d.toString()));
process.stdin.on('end', () => {
  try {
    const data = JSON.parse(chunks.join(''));
    const model = data?.model;
    const name = (typeof model === 'string' ? model : model?.display_name ?? model?.id ?? '').toLowerCase();
    let label = '';
    if (name.includes('opus')) label = 'Complex';
    else if (name.includes('sonnet')) label = 'Balanced';
    else if (name.includes('haiku')) label = 'Simple';
    if (label) process.stdout.write(label);
  } catch {}
});
