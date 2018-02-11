# .bashrc - My favored .bashrc file. (c) 2018 BachNX
# Home: https://github.com/thanbaiks/bashrc

# Build prompt
__SEP=$(printf "\xEE\x82\xB0")
__GIT_ICON=$(printf "\xEF\x90\x98")
__GIT_SEG() {
  if [ -n "`__git_ps1 '%s'`" ]; then
    echo "$__GIT_ICON `__git_ps1 '%s'`"
  else
    echo $__GIT_ICON
  fi
}
__BUILD_PROMPT() {
  # Maybe needed in future
  PS1='\[$(tput setab 4)$(tput setaf 0)\] \u \[$(tput setab 6)$(tput setaf 4)\]$__SEP\[$(tput setaf 0)\] \w \[$(tput setab 2)$(tput setaf 6)\]$__SEP\[$(tput setaf 0)\] `__GIT_SEG` \[$(tput setab 9)$(tput setaf 2)\]$__SEP\[$(tput sgr0)\] '
}
PROMPT_COMMAND=__BUILD_PROMPT

# Load aliases
[ -f ~/.alias ] && . ~/.alias
