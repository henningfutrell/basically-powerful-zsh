#=====================================================
# Shell prompt

# Colors
#
autoload -U colors && colors
# Prompt color
pc="%{$fg[default]%}"
# Directory color
dc="%{$fg[yellow]%}"
# Reset color
rc="%{$reset_color%}"
# New line: This seems to reevaluate when screen size changed
nl=$'\n'

# Set the precmd
function precmd {
  local TERMWIDTH
  (( TERMWIDTH = ${COLUMNS} - 1 ))

}
# Load in git prompt
source "$z_core/git_prompt.sh"

# Sybmols
# ╭─ ╰─ ➜
# Allows functions in the prompt
setopt PROMPT_SUBST

main_prompt="
%{${pc}%}╭─%n@%m %{${dc}%}%~%{${rc}%}"
entry_indicator="%{${pc}%}╰─%{${dc}%} "

# If completion expands after initial word (e.g. > ls  <completed ls>)
# first check that $LANG is en_US.UTF-8. if this is wrong either set 
# LANG=en_US.UTF-8 in /etc/locale.conf for system wide or uncomment below
# to set for user (if you don't have permissions or whatnot).
export LANG=en_US.UTF-8

PROMPT='$main_prompt $(git_status)
$entry_indicator'
#PS2='$pc.. '
#PS3='$pc... '
