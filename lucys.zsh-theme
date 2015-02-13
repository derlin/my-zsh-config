if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi

# custom
local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"
PROMPT='%{${fg[green]}%}%2~ $(git_prompt_info)%{${return_code}${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}✗%{$reset_color%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
