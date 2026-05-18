# dotfiles

My personal macOS dotfiles — zsh, Powerlevel10k, Oh My Zsh, and a customized Claude Code status line.

---

## What's included

| File/Folder | Purpose |
|---|---|
| `.zshrc` | Zsh config, aliases, Oh My Zsh setup, Claude model picker |
| `.zprofile` | Homebrew env initialization |
| `.p10k.zsh` | Powerlevel10k prompt config |
| `.yarnrc` | Yarn config |
| `claude/settings.json` | Claude Code settings (MCP servers, status line, plugins) |
| `claude/model-icon.js` | Status line: dynamic model icon script |
| `claude/effort-label.js` | Status line: complexity label script |
| `claude/ccstatusline-wrapper.sh` | Status line: terminal width wrapper |
| `ccstatusline/settings.json` | ccstatusline layout — 3-line powerline with gradient colors |
| `install.sh` | Symlinks everything into place |

---

## Prerequisites

Install these before running the setup:

```bash
# Homebrew (macOS package manager)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Core tools
brew install git node zsh eza

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Claude Code CLI
npm install -g @anthropic-ai/claude-code

# ccstatusline (Claude Code status line renderer)
npm install -g ccstatusline
```

> A **Nerd Font** is required for icons and powerline glyphs.
> Recommended: [MesloLGS NF](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) (also what p10k recommends).
> Set it as your terminal font before continuing.

---

## Setup

**1. Clone the repo**

```bash
git clone https://github.com/tyburrowbridge/dotfiles ~/GitHub/dotfiles
```

**2. Run the install script**

```bash
bash ~/GitHub/dotfiles/install.sh
```

This symlinks each file from the repo into the expected location. If a file already exists, it gets backed up as `filename.bak` before being replaced.

**3. Add your GitHub PAT to Claude settings**

Open `~/GitHub/dotfiles/claude/settings.json` (or `~/.claude/settings.json` — they're the same symlinked file) and replace `YOUR_GITHUB_PAT_HERE` with a [GitHub personal access token](https://github.com/settings/tokens).

**4. Reload your shell**

```bash
source ~/.zshrc
```

**5. (Optional) Re-run Powerlevel10k config wizard**

If the prompt looks off, run:

```bash
p10k configure
```

This will overwrite `.p10k.zsh` with your own choices. Commit it back to your fork if you want to save it.

---

## Claude Code status line

The status line shows three lines inside Claude Code's terminal:

```
 Balanced  claude-sonnet-4-6  ▓▓▓▓▓▓░░░░
  team-member-invites  (+1,-33)
  .../GitHub (Viasat)/ad-platform-prototype
```

- **Line 1** — model tier label, model name, context usage bar
- **Line 2** — git branch and change count
- **Line 3** — current working directory (last 2 segments)

Colors step dark→light left to right using a monochromatic purple/indigo/slate palette.

---

## Key aliases

| Alias | Command |
|---|---|
| `ls` / `ll` / `la` | `eza` with icons |
| `zshconfig` | Open `.zshrc` in VS Code |
| `claude` | Interactive model picker (opus / sonnet / haiku) |
| `claude-high/medium/low` | Launch Claude with a specific model tier directly |
| `projects` | Jump to `~/GitHub (Viasat)/` |
