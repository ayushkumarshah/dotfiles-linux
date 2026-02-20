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



test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

