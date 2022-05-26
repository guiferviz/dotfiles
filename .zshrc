# Load oh-my-zsh plugin manager Antigen.
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Suggestions based on history
antigen bundle zsh-users/zsh-autosuggestions

# Install themes and load the start up theme.
antigen theme amuse

# Tell Antigen that you're done.
antigen apply

# Load custom aliases.
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

# Fuzzy finder.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Python Poetry.
source $HOME/.poetry/env

# OS dependent settings.
if [[ `uname` == "Linux" ]]; then
    source ~/.zshrc_linux
elif [[ `uname` == "Darwin" ]]; then
    source ~/.zshrc_mac
else
    echo 'Unknown OS!'
fi

# Make and change dir all in one.
mkcd ()
{
    mkdir -p -- "$1" && cd -P -- "$1"
}

# Activate direnv (autoload .envrc files when changing directory)
eval "$(direnv hook $SHELL)"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc