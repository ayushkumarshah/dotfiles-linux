# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export PATH=/usr/bin/python3:$PATH
# export HOMEBREW_BUNDLE_FILE=~/.Brewfile
#

export PATH=/home/shahayush/.cargo/bin/:$PATH
export PATH=$HOME/.local/bin:$PATH

export http_proxy="http://fwdproxy:8080"
export https_proxy="http://fwdproxy:8080"
export no_proxy=".fbcdn.net,.facebook.com,.thefacebook.com,.tfbnw.net,.fb.com,.fburl.com,.facebook.net,.sb.fbsbx.com,localhost"
export NO_PROXY="$no_proxy"

# export CLAUDE_CODE_VERSION_OVERRIDE="latest"
export META_CLAUDE_CODE_RELEASE="latest"
export META_CLAUDE_USE_GCP_DIRECT=0
export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1
