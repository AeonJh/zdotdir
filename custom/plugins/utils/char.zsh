### Generic functions
#
# 1. h2d: Convert hex to decimal
# 2. d2h: Convert decimal to hex
h2d(){
  usage="Usage: h2d <hex_number>..."
  # check if hex number is provided
  if [[ -z "$1" ]]; then
    echo $usage
    return
  fi
  for arg in "$@"; do
    # echo -n "$(echo "ibase=16; ${arg^^}"|bc) " # uppercase ${arg^^} is for bash 4.0+, unsupported for zsh
    echo -n "$(echo "ibase=16; ${(U)arg}"|bc) "
  done
}

d2h(){
  usage="Usage: d2h <decimal_number>..."
  # check if decimal number is provided
  if [[ -z "$1" ]]; then
    echo $usage
    return
  fi
  for arg in "$@"; do
    echo -n "$(echo "obase=16; $arg"|bc) "
  done
}

# 3. display various color codes
# more color codes: https://misc.flogisoft.com/bash/tip_colors_and_formatting
color(){
  usage="Usage: color <color_code> <text>"
  # check if color code && text is provided
  if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    echo $usage
    return
  fi
  echo -e "\e[$1m$2\e[0m"
}
