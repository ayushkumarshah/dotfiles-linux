# Dotfiles (Linux / Meta DevServer / OnDemand)

My configuration files for zsh, neovim (LazyVim), tmux, and claude code.

## Quick Setup

```bash
git clone git@github.com:ayushkumarshah/dotfiles-linux.git ~/dotfiles-linux
cd ~/dotfiles-linux
./setup.sh
```

The setup script will:
- Back up any existing config files to `~/dotfiles-backup-<timestamp>/`
- Create symlinks from the repo to the correct home directory locations

### What gets symlinked

| Repo path | Symlinked to |
|---|---|
| `.tmux.conf` | `~/.tmux.conf` |
| `.zshrc` | `~/.zshrc` |
| `.gitconfig` | `~/.gitconfig` |
| `.config/nvim/` | `~/.config/nvim` |
| `.config/zsh/` | `~/.config/zsh` |
| `.tmux/{scripts}` | `~/.tmux/{scripts}` |
| `.claude/CLAUDE.md` | `~/.claude/CLAUDE.md` |
| `.claude/settings.json` | `~/.claude/settings.json` |
| `.claude/commands/*` | `~/.claude/commands/*` |

---

## Neovim

### Installation on DevServer

Follow the [Quick Start guide](https://www.internalfb.com/wiki/Development_Environment/Neovim/Quick_Start/#osx-steps).

After installation, the setup script handles symlinking the config. Just open `nvim` and let Lazy install plugins.

### Installation on Mac

The wiki method may not work. Install via Homebrew instead, then copy Meta support files from devserver:

```bash
# Install neovim
brew install neovim

# Copy fb-editor-support from devserver
mkdir -p .config/nvim
rsync -azP dev:/usr/share/fb-editor-support/nvim/preconfigured/ ~/.config/nvim/
scp -r dev:/usr/share/fb-editor-support ~/Desktop/dotfiles-mac/copied
sudo cp -fr ~/Desktop/dotfiles-mac/copied/nvim/* /usr/local/share/fb-editor-support/nvim
```

Update `init.lua` to point to the local fb-editor-support path:

```lua
dir = "/usr/local/share/fb-editor-support/nvim",
```

### On a New OnDemand Instance

Run `:MetaSyncLs` in neovim to sync Meta LSP servers.

### Neovim@Meta Plugins

Install the [Neovim@Meta Plugin](https://www.internalfb.com/wiki/Development_Environment/Neovim/Neovim@Meta_Plugin/).

### CodeCompose / Metamate

Follow the [Metamate setup guide](http://internalfb.com/wiki/Development_Environment/Neovim/Metamate_%28formerly_CodeCompose%29_support/).

### Claude Code Vim Extension

Plugin: [claudecode.nvim](https://github.com/coder/claudecode.nvim). Already configured in `lua/plugins/claude.lua`.

Keybindings:

| Key | Action |
|---|---|
| `<leader>ac` | Toggle Claude |
| `<leader>af` | Focus Claude |
| `<leader>ar` | Resume Claude |
| `<leader>aC` | Continue Claude |
| `<leader>as` | Send selection to Claude (visual mode) |
| `<leader>aa` | Accept diff |
| `<leader>ad` | Deny diff |

### Fixing Treesitter CLI Issues

```bash
# Install build dependencies
sudo dnf install clang cargo

# Configure cargo proxy
cat >> ~/.cargo/config.toml << 'EOF'
[http]
proxy = "fwdproxy:8080"
[https]
proxy = "fwdproxy:8080"
EOF

# Install tree-sitter-cli
cargo install --locked tree-sitter-cli
```

---

## Tmux

### Install TPM (Tmux Plugin Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then inside tmux, press `prefix + I` to install all plugins.

### Features

- Pane visibility: double-line borders, `▸ ACTIVE` label on active pane, dimmed inactive panes
- OD-specific resurrect directory (sessions saved separately for devserver vs OnDemand)
- vim-tmux-navigator integration (`Ctrl-h/j/k/l` to move between vim and tmux panes)
- Tmux resurrect for session persistence (`prefix + Ctrl-s` to save, `prefix + Ctrl-r` to restore)

---

## Zsh

### Prerequisites

```bash
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Proxy Setup

If not already in `.config/zsh/exports.zsh`, add:

```bash
export http_proxy="http://fwdproxy:8080"
export https_proxy="http://fwdproxy:8080"
export no_proxy=".fbcdn.net,.facebook.com,.thefacebook.com,.tfbnw.net,.fb.com,.fburl.com,.facebook.net,.sb.fbsbx.com,localhost"
export NO_PROXY="$no_proxy"
```

### Jump History (zsh-z)

The `j` command uses zsh-z for directory jumping. The database is stored at `~/.z`. Add it to dotsync2 paths to retain across OnDemands:

```bash
dotsync2 paths edit
# Add: .z
```

---

## Ranger

### Install

```bash
# DevServer
sudo dnf install ranger
# OR
pip3 install --user ranger-fm

# OnDemand
pip3 install --user ranger-fm
```

Already configured as a neovim plugin in `lua/plugins/ranger.lua`. Open with `<leader>r`.

---

## Session Management (Neovim)

Neovim sessions are managed via `persistence.nvim`. Keybindings:

| Key | Action |
|---|---|
| `<leader>;` | Open dashboard |
| `<leader>qs` | Select and load a session |
| `<leader>qS` | Save current session |
| `<leader>ql` | Load session for current directory |
| `<leader>qL` | Load last session |
| `<leader>qd` | Stop session auto-save |
| `<leader>qx` | Delete session(s) (multi-select with Tab) |

---

## dotsync2 Paths

Add these to `dotsync2 paths edit` for persistence across OnDemands:

```
.z
.local/share/tmux/resurrect-od
```

---

## Source Control (Sapling/Mercurial)

The neovim config uses `meta.hg` for hg/sl gutter signs (gitsigns and vim-signify are disabled). Provides:

- `+` / `▎` signs for added lines, `_` / `▎` for deleted lines
- Hunk navigation: `]h` / `[h` (next/prev hunk)
- `:HgBlame`, `:HgDiff`, `:HgSsl` (interactive smartlog), `:HgCommit`, `:HgAmend`

Useful sl equivalents:

| Git | Sapling |
|---|---|
| `git checkout -- <file>` | `sl revert <file>` |
| `git status` | `sl status` |
| `git diff` | `sl diff` |
| `git log` | `sl log` |
