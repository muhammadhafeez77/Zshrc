# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="tonotdo"
ZSH_THEME="xiong-chiamiov"


# Texteditor and zshconfig aliases
alias zshc="nvim ~/.zshrc"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git repo history-substring-search docker zsh-syntax-highlighting encode64 web-search colored-man-pages extract)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Have no chaining duplicates (meaning only the latest command if same command executed multiple times) in hist
export HISTCONTROL=ignoreboth:erasedups

# Announce 256 bit color support
export TERM=xterm-256color

# Less gdb output
#alias gdb='gdb -q'

# Update pip packages
#alias pipupgrade="pip list --format=legacy --outdated | cut -d ' ' -f1 | xargs -n1 pip install -U"
#alias pipupgrade_sudo="pip list --format=legacy --outdated | cut -d ' ' -f1 | xargs -n1 sudo pip install -U"

# we want to use ripgrep instead of grep.
#alias grep="echo Using rg instead of grep; rg"

# Create a new directory and cd into it
# Similar to "mkdir xxx && cd $_"
#
mkcd() {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

fpath=(/usr/local/share/zsh-completions $fpath)
fpath+=~/.zfunc
compinit

source <(fzf --zsh)
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias zen='flatpak run app.zen_browser.zen'
alias vimo='nvim ~/.config/oxwm/config.lua'


# Custom Syntax Highlighting Styles
typeset -A ZSH_HIGHLIGHT_STYLES

# Make valid commands green AND bold
ZSH_HIGHLIGHT_STYLES[command]='fg=#00ff00,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#00ff00,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#00ff00,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#00ff00,bold'

#ZSH_HIGHLIGHT_STYLES[default]='fg=,#00ff00,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#00ff00,bold'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#00ff00,bold'

## Make invalid commands red (can be changed to any shade/style)
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[path_approx]='#D3D3D3'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#D3D3D3'
