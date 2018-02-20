# .bashrc - My favored .bashrc file. (c) 2018 BachNX
# Home: https://github.com/thanbaiks/bashrc

# Build prompt
_SEP=$(printf "\xEE\x82\xB0")
_GIT_ICON=$(printf "\xEF\x90\x98")
_ANSI_RESET=$(printf "\e[m")
_ANSI_L2=$(printf "\e[2D")
_ANSI_COLOR() {
  printf "\e[3$1;4$2m"
}
_BUILD_PROMPT() {
  # Build up segments
  GIT="$(__git_ps1 "%s")";
  if [ -n "$GIT" ]; then
    GIT="$_GIT_ICON $GIT"
  fi
  BG=""
  PRINT() {
    if [ -z "$BG" ]; then
      PS1="\[$(_ANSI_COLOR $1 $2)\]"
    else
      PS1="$PS1""\[$_ANSI_L2$(_ANSI_COLOR $BG $2)\]$_SEP"
    fi
    PS1="$PS1""\[$(_ANSI_COLOR $1 $2)\] $3 \[$(_ANSI_COLOR $2 9)\]$_SEP\[$_ANSI_RESET\] "
    BG=$2
  }
  PRINT 0 4 '\u'; PRINT 0 6 '\w'; [ -n "$GIT" ] && PRINT 0 2 "$GIT";
}
# __BUILD_PROMPT
PROMPT_COMMAND=_BUILD_PROMPT

# Load aliases
[ -f ~/.alias ] && . ~/.alias
