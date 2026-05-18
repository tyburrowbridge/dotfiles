#!/usr/bin/env bash
# install.sh — symlink dotfiles into place
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$DOTFILES/$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "  backing up $dst → $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sf "$src" "$dst"
  echo "  linked $dst"
}

echo "Installing dotfiles from $DOTFILES"

# Shell
link .zshrc           "$HOME/.zshrc"
link .zprofile        "$HOME/.zprofile"
link .p10k.zsh        "$HOME/.p10k.zsh"
link .yarnrc          "$HOME/.yarnrc"

# Claude Code
link claude/settings.json          "$HOME/.claude/settings.json"
link claude/model-icon.js          "$HOME/.claude/model-icon.js"
link claude/effort-label.js        "$HOME/.claude/effort-label.js"
link claude/ccstatusline-wrapper.sh "$HOME/.claude/ccstatusline-wrapper.sh"

# ccstatusline
link ccstatusline/settings.json    "$HOME/.config/ccstatusline/settings.json"

echo ""
echo "Done. Restart your shell or run: source ~/.zshrc"
echo ""
echo "Note: edit claude/settings.json and replace YOUR_GITHUB_PAT_HERE with your actual token."
