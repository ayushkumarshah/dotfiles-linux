#!/bin/bash
# setup.sh — Set up dotfiles symlinks on a fresh machine
# Usage: ./setup.sh
#
# This script creates symlinks from this repo to the home directory.
# It backs up any existing files before overwriting.

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "Dotfiles directory: $DOTFILES_DIR"
echo "Backup directory:   $BACKUP_DIR"
echo ""

backup_and_link() {
    local src="$1"  # source in dotfiles repo
    local dst="$2"  # destination in home

    # Skip if source doesn't exist
    if [ ! -e "$src" ]; then
        echo "  SKIP (not in repo): $src"
        return
    fi

    # Already correctly linked
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        echo "  OK (already linked): $dst"
        return
    fi

    # Backup existing file/dir if it exists and isn't a symlink
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        mkdir -p "$BACKUP_DIR"
        local backup_path="$BACKUP_DIR/$(basename "$dst")"
        echo "  BACKUP: $dst -> $backup_path"
        mv "$dst" "$backup_path"
    fi

    # Create parent directory if needed
    mkdir -p "$(dirname "$dst")"

    ln -sf "$src" "$dst"
    echo "  LINK: $dst -> $src"
}

echo "=== Setting up symlinks ==="
echo ""

# --- Top-level dotfiles ---
echo "[dotfiles]"
backup_and_link "$DOTFILES_DIR/.tmux.conf"  "$HOME/.tmux.conf"
backup_and_link "$DOTFILES_DIR/.zshrc"      "$HOME/.zshrc"
backup_and_link "$DOTFILES_DIR/.gitconfig"  "$HOME/.gitconfig"

# --- .config directories ---
echo ""
echo "[.config]"
backup_and_link "$DOTFILES_DIR/.config/nvim"  "$HOME/.config/nvim"
backup_and_link "$DOTFILES_DIR/.config/zsh"   "$HOME/.config/zsh"

# --- .tmux scripts (individual files, not the whole dir) ---
echo ""
echo "[.tmux scripts]"
mkdir -p "$HOME/.tmux"
backup_and_link "$DOTFILES_DIR/.tmux/renew_env.sh"     "$HOME/.tmux/renew_env.sh"
backup_and_link "$DOTFILES_DIR/.tmux/tmux.remote.conf"  "$HOME/.tmux/tmux.remote.conf"
backup_and_link "$DOTFILES_DIR/.tmux/yank.sh"           "$HOME/.tmux/yank.sh"

# --- .claude config files (individual files, not the whole dir) ---
echo ""
echo "[.claude]"
mkdir -p "$HOME/.claude/commands"
backup_and_link "$DOTFILES_DIR/.claude/CLAUDE.md"       "$HOME/.claude/CLAUDE.md"
backup_and_link "$DOTFILES_DIR/.claude/settings.json"   "$HOME/.claude/settings.json"
for f in "$DOTFILES_DIR/.claude/commands/"*; do
    [ -e "$f" ] || continue
    fname="$(basename "$f")"
    backup_and_link "$f" "$HOME/.claude/commands/$fname"
done

echo ""
echo "=== Symlinks complete ==="
echo ""

# --- Post-setup reminders ---
echo "=== Post-setup steps ==="
echo ""
echo "1. Install tmux plugin manager (TPM) and plugins:"
echo "   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
echo "   Then press prefix + I inside tmux to install plugins"
echo ""
echo "2. Open neovim and let Lazy install plugins:"
echo "   nvim"
echo ""
echo "3. In neovim, sync Meta LSPs (on OD/devserver):"
echo "   :MetaSyncLs"
echo ""
echo "4. If on a new OD, you may need to install ranger:"
echo "   pip3 install --user ranger-fm"
echo ""
