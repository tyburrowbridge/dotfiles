# dotfiles

My macOS setup. Zsh, Powerlevel10k, Oh My Zsh, and a Claude Code status line that's frankly too good for a terminal.

Feel free to use it. No guarantees it won't make your existing setup feel inadequate.

---

## What's in the box

| File/Folder | What it does |
|---|---|
| `.zshrc` | The whole personality. Aliases, Oh My Zsh, Claude model picker. |
| `.zprofile` | Homebrew env. Boring but necessary. |
| `.p10k.zsh` | Powerlevel10k config. This one took a while. Don't touch it. |
| `.yarnrc` | Yarn. It's here. Moving on. |
| `claude/settings.json` | Claude Code settings — MCP servers, plugins, status line wiring. |
| `claude/model-icon.js` | Outputs a lightbulb icon in the right color. Yes, this is a whole script. |
| `claude/effort-label.js` | Prints "Balanced", "Complex", or "Simple" based on the active model. |
| `claude/ccstatusline-wrapper.sh` | Detects terminal width so the status line doesn't look broken. |
| `ccstatusline/settings.json` | Three-line powerline status bar with a purple gradient. It's pretty. |
| `install.sh` | Symlinks everything. Run it once, forget it forever. |

---

## Before you start

You'll need a few things installed. Don't skip the font — everything will look like mojibake without it.

**The font (do this first)**

Download and install [MesloLGS NF](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k), then set it as your terminal font. Powerline glyphs and nerd icons will not render without it. You've been warned.

**Everything else**

```bash
# Homebrew — if you're on macOS without this, how are you surviving
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Core tools
brew install git node zsh eza

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-autosuggestions (you'll wonder how you lived without it)
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Claude Code
npm install -g @anthropic-ai/claude-code

# ccstatusline (the thing that renders the fancy status bar)
npm install -g ccstatusline
```

---

## Setup

**1. Clone it**

```bash
git clone https://github.com/tyburrowbridge/dotfiles ~/GitHub/dotfiles
```

**2. Run the install script**

```bash
bash ~/GitHub/dotfiles/install.sh
```

Symlinks everything into place. If something already exists at a destination it gets backed up as `filename.bak` — so nothing gets nuked without warning.

**3. Add your GitHub PAT**

Open `claude/settings.json` and replace `YOUR_GITHUB_PAT_HERE` with a real [GitHub personal access token](https://github.com/settings/tokens). Without this the GitHub MCP server won't work and Claude will act confused.

**4. Reload**

```bash
source ~/.zshrc
```

**5. Fix the prompt if it looks wrong (optional)**

```bash
p10k configure
```

Runs the Powerlevel10k wizard and overwrites `.p10k.zsh` with your choices. Commit it back if you want to keep it.

---

## The status line

Three lines of purple-gradient powerline goodness inside Claude Code:

```
 Balanced  claude-sonnet-4-6  ▓▓▓▓▓▓░░░░
  team-member-invites  (+1,-33)
  .../GitHub/your-project
```

- **Line 1** — which model you're on, what tier it is, and how much context you've burned through
- **Line 2** — git branch and staged/unstaged changes
- **Line 3** — where you are (last 2 path segments)

Colors go dark to light left to right. The icon changes color by model tier. It's a lot of effort for a status bar and it was worth it.

---

## Aliases worth knowing

| Alias | Does what |
|---|---|
| `ls` / `ll` / `la` | `eza` with icons — `ls` but it doesn't make you sad |
| `zshconfig` | Opens `.zshrc` in VS Code |
| `claude` | Interactive picker — choose opus, sonnet, or haiku |
| `claude-high` / `claude-medium` / `claude-low` | Skip the picker, go straight to the model |
| `projects` | `cd` to `~/GitHub (Viasat)/` |
