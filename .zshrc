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

# Add node to PATH.
export PATH=/Users/guillermofernandez/node-v16.13.0-darwin-x64/bin:$PATH

# Set up Java.
export JAVA_HOME="$HOME/jdk-11.0.12.jdk/Contents/Home/"
export PATH="$PATH:$JAVA_HOME/bin"

# Set up Spark.
export SPARK_HOME="$HOME/spark-3.2.0-bin-hadoop3.2/"
export PATH="$SPARK_HOME/bin:$PATH"

# Set up Ruby and Gem and adding installed executables to the path.
export PATH="$PATH:$HOME/rubygems-3.2.33/bin/"
export PATH=$PATH:$(find $HOME/.gem/ruby/*/bin -type d)

# Make and change dir all in one.
mkcd ()
{
    mkdir -p -- "$1" && cd -P -- "$1"
}

# Add home folder to PATH to use iTerm, rg, storageexplorer...
export PATH=/Users/guillermofernandez/:$PATH

# Activate direnv (autoload .envrc files when changing directory)
eval "$(direnv hook $SHELL)"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
