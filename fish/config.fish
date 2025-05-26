if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x HOMEBREW_CASK_OPTS "--appdir=/Users/maorfrost/Applications"
eval "$(/opt/homebrew/bin/brew shellenv)"

# aliases:

alias vim='NVIM_APPNAME="nvim-kickstart" nvim' 
alias vi='NVIM_APPNAME="nvim-personal" nvim' 
