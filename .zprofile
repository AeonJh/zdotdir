#!/bin/zsh
#
# .zprofile - Zsh file loaded on login.
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="${BROWSER:-open}"
fi

#
# Editors
#

export EDITOR="${EDITOR:-vim}"
export VISUAL="${VISUAL:-vim}"
command -v nvim >/dev/null 2>&1 && export EDITOR="${EDITOR:-nvim}" && export VISUAL="${VISUAL:-nvim}"
export PAGER="${PAGER:-less}"

#
# Paths
#

if [[ -f ${HOME}/.config/local/.path.local ]]; then
    source ${HOME}/.config/local/.path.local
else
    echo -e "\033[0;33mWARN: ${HOME}/.config/local/.path.local not found.\033[0m"
fi

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,local}/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)
