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

directories=(
    "/home/aeonjh/.local/bin"
    "/opt/nvim-linux64/bin"
    "/opt/VSCode-linux-x64/bin"
    "/opt/SimplicityCommander-Linux/commander"
)

for dir in "${directories[@]}"; do
    if [[ -d "$dir" ]]; then
        export PATH="$dir:$PATH"
    fi
done

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)
