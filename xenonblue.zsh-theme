# Custom Fork of Darkblood, but with a blue tinted theme. [drtac7]

PROMPT=$'%{$fg[blue]%}┌[%{$fg_bold[white]%}%n%{$reset_color%}%{$fg[cyan]%}@%{$fg_bold[white]%}%m%{$reset_color%}%{$fg[blue]%}]
%{$fg[blue]%}└[%{$fg_bold[cyan]%}%~%{$reset_color%}%{$fg[blue]%}]%{$fg[white]%}>:%{$reset_color%} '
PS2=$' %{$fg[cyan]%}|%{fg[green]%}>:%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}[%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[blue]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[blue]%}⚡%{$reset_color%}"
