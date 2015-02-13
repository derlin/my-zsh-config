#if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi
if [ $UID -eq 0 ]; then CARET="#"; else CARET="»"; fi

# custom
#local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local caret="%(?:%{$fg_bold[green]%}${CARET}:%{$fg_bold[red]%}${CARET}%s)"
#PROMPT='%{${fg[green]}%}%2~ $(git_prompt_info)%{${return_code}${fg_bold[$CARETCOLOR]}%}» % %{${reset_color}%}'
PROMPT='%{${fg[green]}%}%2~ $(git_prompt_info)${caret} %{${reset_color}%}'
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}✗%{$reset_color%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
