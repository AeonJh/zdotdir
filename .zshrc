# zmodload zsh/zprof
#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh options.
setopt extended_glob

# Autoload functions you might want to use with antidote.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uz $fpath[1]/*(.:t)

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

#
# Work
# 

[[ -f $HOME/matter-keys/nl_keys.sh ]] && source $HOME/matter-keys/nl_keys.sh

#
# Cunstom color palette for man page.(command less)
# 

# export LESS_TERMCAP_mb=$'\E[1m\E[32m'
# export LESS_TERMCAP_mh=$'\E[2m'
# export LESS_TERMCAP_mr=$'\E[7m'
# export LESS_TERMCAP_md=$'\E[1m\E[36m'
# export LESS_TERMCAP_ZW=""
# export LESS_TERMCAP_us=$'\E[4m\E[1m\E[37m'
# export LESS_TERMCAP_me=$'\E(B\E[m'
# export LESS_TERMCAP_ue=$'\E[24m\E(B\E[m'
# export LESS_TERMCAP_ZO=""
# export LESS_TERMCAP_ZN=""
# export LESS_TERMCAP_se=$'\E[27m\E(B\E[m'
# export LESS_TERMCAP_ZV=""
# export LESS_TERMCAP_so=$'\E[1m\E[33m\E[44m'

#
# Set bat as the default pager for man
#

[[ -x "$(command -v bat)" ]] && export MANPAGER="sh -c 'col -bx | bat -l man -p'"


#
# Custom zsh-vi-mode configuration
# 
 
# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# Bindkey (for zvm, need to override the original after init.)
function zvm_after_init() {
	bindkey '^[h' backward-char
	bindkey '^[l' forward-char
	bindkey '^[j' history-search-forward
	bindkey '^[k' history-search-backward
}

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
# zprof
