source /usr/facebook/ops/rc/master.zshrc
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# ZSH config
[ -f $HOME/.config/zsh/exports.zsh ] && source $HOME/.config/zsh/exports.zsh
[ -f $HOME/.config/zsh/aliases.zsh ] && source $HOME/.config/zsh/aliases.zsh
# [ -f $HOME/.config/zsh/conda.zsh ] && source $HOME/.config/zsh/conda.zsh
[ -f $HOME/.config/zsh/ohmyzsh.zsh ] && source $HOME/.config/zsh/ohmyzsh.zsh
# [ -f $HOME/.config/zsh/google_cloud.zsh ] && source $HOME/.config/zsh/google_cloud.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh


# Auto-mount Google Drive (fast: skips if already mounted)
if [ -f "$HOME/bin/gdrive-mount.sh" ]; then
  ~/bin/gdrive-mount.sh &
  disown 2>/dev/null
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# Google Drive auto-mount (managed by gdrive-mount plugin)
source ~/.claude/gdrive-mount-scripts/auto-mount.sh
source ~/.claude/gdrive-mount-scripts/vscode-workspace.sh
