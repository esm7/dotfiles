# TODO: split this file to a few, see https://github.com/anishathalye/dotfiles/tree/master/zsh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/dotfiles/oh-my-zsh-custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="erez"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Always auto update without a prompt
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

export PATH=$HOME/bin:/usr/local/bin:$PATH
source $HOME/.zshrc.local 2> /dev/null
# export MANPATH="/usr/local/man:$MANPATH"

# Glob completion when pressing Tab
setopt glob_complete

# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
# and http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='default'
ZSH_HIGHLIGHT_STYLES[path_prefix]='default'
ZSH_HIGHLIGHT_STYLES[command]='bold'
ZSH_HIGHLIGHT_STYLES[builtin]='bold'
ZSH_HIGHLIGHT_STYLES[alias]='bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[precommand]='bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=red'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=red'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#                                          \/ IMPORTANT, zsh-syntax-highlighting must be kept last!
plugins=(vi-mode taskwarrior docker docker-compose git zsh-syntax-highlighting)

# User configuration

source $ZSH/oh-my-zsh.sh
eval `cat $HOME/dotfiles/lscolors.sh`
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' menu select=1

# Source fzf, this is done before custom key bindings are set
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Make key sequences, especially considering vi mode, faster
KEYTIMEOUT=1
# The vi-mode plugin removes the important ^r binding
bindkey '^r' history-incremental-search-backward
# Home key variants
bindkey '\e[1~' vi-beginning-of-line
bindkey '\eOH' vi-beginning-of-line
# End key variants
bindkey '\e[4~' vi-end-of-line
bindkey '\eOF' vi-end-of-line
# Delete key sometimes doesn't work under ssh
bindkey '\e[3~' delete-char
# Ctrl+Left/Right
bindkey '\e[1;5D' backward-word
bindkey '\e[1;5C' forward-word
# oh-my-zsh overrides Alt+. for the last word
bindkey '\e.' insert-last-word
# Undo
bindkey '^u' undo

bindkey '^F' fzf-file-widget

# Make Ctrl+Space jump to Vim normal mode at the beginning of the line
vi-normal-begin-line() {
	zle vi-cmd-mode
	zle vi-beginning-of-line
}
zle -N vi-normal-begin-line 
bindkey ^' ' vi-normal-begin-line 
bindkey -a ^' ' vi-beginning-of-line
bindkey -a H vi-beginning-of-line
bindkey -a L vi-end-of-line

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias df="df -h"
alias du="du -h -d 1"
alias gps="ps -ef | grep -i"
alias lt="ls -trl"
alias rf="readlink -f"
alias gdtool="git difftool"

alias to="task limit:page office"
alias th="task limit:page home"
alias tp="task processing"
alias ta="task add"
alias tm="task modify"

echo "Forking to update dotfiles, log will be at ~/dotbot.log"
((cd dotfiles && git pull --quiet && ./install > ~/dotbot.log && cd ~ )&)

# Allow executing something to run after zsh loads
eval "$RUN_AFTER_ZSH_STARTUP"

