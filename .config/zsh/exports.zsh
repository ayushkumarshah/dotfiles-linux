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

# My scripts
export PATH="/home/$USER/scripts:$PATH"

export LgEvalDir="/home/$USER/Desktop/MathSeer/MathSeer_latest/modules/lgeval"
export CROHMELibDir="/home/$USER/Desktop/MathSeer/qdgga/tools/crohmelib"     
export PATH=$PATH:$CROHMELibDir/bin:$LgEvalDir/bin:$LgEvalDir/convert2symLG
export PYTHONPATH=$PYTHONPATH:`dirname $CROHMELibDir`:`dirname $LgEvalDir`
# export QDGGA_TOOLS="/home/$USER/Desktop/MathSeer/qdgga/tools/"
# export PATH=$PATH:$QDGGA_TOOLS
export PATH=$PATH:/home/$USER/bin

# Cuda 10.1
export PATH=$PATH:/usr/local/cuda-10.1/bin
export CUDADIR=/usr/local/cuda-10.1
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.1/lib64
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PYTHONPATH=$PYTHONPATH:/home/as1211/Desktop/MathSeer/qdgga/tools
