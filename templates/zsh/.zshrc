#!/usr/bin/env zsh

if [ "$EMACS" ]; then
    bash - # use bash if executed on emacs
    return
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export ZSH_ROOT=${DOTFILES_ROOT:="$HOME/Development/dotfiles"}/zsh

# aliases
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ll='ls -l'
alias grep='grep --color=auto'
alias p='pushd .'
alias pp='popd'

# emacs
alias emacs="emacsclient -nw -ca '' $@"
export EDITOR='\emacs -nw'
export VISUAL='\emacs -nw'

# history
HISTSIZE=50000
HISTFILESIZE=100000


# google suggestion
SPROMPT="もしかして: %r?"

# hostname
PROMPT=%K{red}%m%k$PROMPT

# sushi
DEFAULT_MARK=$'\xF0\x9F\x8D\xA3' # sushi
ERROR_MARK=$'\xF0\x9F\x8D\xA2'   # oden
PROMPT=${PROMPT}$'%(?.${DEFAULT_MARK}.${ERROR_MARK})  '

source "${ZSH_ROOT}/utilities.zsh"

case ${OSTYPE} in
    darwin*)
        if [ -e "${ZSH_ROOT}/zshrc.Darwin" ]; then
            source "${ZSH_ROOT}/zshrc.Darwin"
        else
            echo "${ZSH_ROOT}/zshrc.Darwin is not found."
        fi
        ;;
    linux*)
        if [ -e "${ZSH_ROOT}/zshrc.ubuntu" ]; then
            source "${ZSH_ROOT}/zshrc.ubuntu"
        else
            echo "${ZSH_ROOT}/zshrc.ubuntu is not found."
        fi
        ;;
esac

if [ -e $HOME/.zshrc.custom ]; then
    source $HOME/.zshrc.custom
fi
