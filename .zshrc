# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="lucys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux docker python sublime sudo systemd vagrant)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
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

# -------------- completion
#{{{ Completion

autoload -U compinit
compinit
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

zstyle ':completion:*' menu select=1 _complete _ignored _approximate
# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
     'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'

# highlight matching part of available completions
autoload -U colors ; colors
zstyle ':completion:*' list-colors  'reply=( "=(#b)(*$PREFIX)(?)*=00=$color[green]=$color[bg-green]" )'
#}}}
# -------------- options
#{{{ Options
# Treat  the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation, etc.  (An initial unquoted ‘~’ always produces named directory expansion.)
# setopt EXTENDED_GLOB
# Note: doesn't work unless recexact is set:

# Causes exact matches to be accepted, even if there are other possible completions
# (Mandatory for the cd ~<TAB> to expand to cd /home/user)
#setopt REC_EXACT

# if the completion is ambiguous, immediately display the list of possible completions
setopt AUTO_LIST

# When attempting a completion on an ambiguous match, instead of simply appending all remaining
# characters shared by all possible matches and waiting , immediately insert the entire 
# first possible match and display the completion menu. 
setopt MENU_COMPLETE

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# Do not require a leading '.' in a filename to be matched explicitly.
setopt GLOB_DOTS
#}}}
# -------------- history management 
#{{{ History management

# Don't overwrite, append!
setopt APPEND_HISTORY

# Write after each command
# setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
# setopt HIST_IGNORE_ALL_DUPS # seems to mess with the vim autocompletion (_vim_files: function definition file not found)

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS
#}}}
# -------------- sourcing 
#{{{ sourcing

if [ -f ~/.arch_aliases ]; then
    source ~/.arch_aliases
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

#}}}
# -------------- key binding
#{{{ key binding

bindkey -v          # vim style prompt

# Use ctrl+arrow to move between words
bindkey "^[[1;5D" .backward-word
bindkey "^[[1;5C" .forward-word

# Use ctrl+shift+arrow to delete words
bindkey "^[[1;6D" backward-delete-word

# Correct vi mode annoying behavior...
bindkey "^[[1;6C" delete-word
bindkey "^[[3~"   delete-char
bindkey '^R' history-incremental-search-backward

#}}}
# -------------- other
#{{{ other
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PS1=`hostname`$PS1
fi
#}}}