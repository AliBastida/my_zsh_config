export VISUAL=vim
export EDITOR=vim
export PATH=$PATH:$HOME/bin
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

autoload -U colors
colors

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on %b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
#PROMPT='%B%F{magenta}%n${PWD/#$HOME/}%f%b%F{123}${vcs_info_msg_0_} % '
PROMPT='%B%F{magenta}%n%f%b %F{cyan}${PWD/#$HOME/}%f ${vcs_info_msg_0_} %B%F{magenta}>%f%b '
RPROMPT='%B%F{blue}%T%f%b'
zstyle ':vcs_info:git:*' formats '%F{green}(%b)%r%f'
#zstyle ':vcs_info:*' enable git
