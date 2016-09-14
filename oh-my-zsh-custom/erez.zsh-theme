local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%m%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

VI_MODE_INDICATOR="%{$fg_bold[magenta]%}[N]%{$reset_color%}"

function vi_mode_prompt_info() {
  echo " ${${KEYMAP/vicmd/$VI_MODE_INDICATOR}/(main|viins)/}"
}

CLOCK="%{$reset_color%}[%D{%H:%M}]%{$reset_color%}"

RPS1='$(vi_mode_prompt_info) $CLOCK'

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
