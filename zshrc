# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && . "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

if [[ $OSTYPE == "darwin"* ]]; then
    export PATH=/opt/homebrew/bin:$PATH
    export HOMEBREW_CASK_OPTS="--caskroom=$HOME/.brew/cask/ --appdir=~/Applications"
    . ~/.iterm2_shell_integration.zsh 
fi

ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
autoload -U compinit && compinit
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fd)

if [[ $TERM_PROGRAM =~ ^(iTerm.app|tmux)$ || ! -z $WT_SESSION || ${$(ps -p $(ps -p $$ -o ppid=) -o cmd=):t} =~ ^gnome-terminal ]]
then
    ZSH_THEME="powerlevel10k/powerlevel10k"
    [ -f ~/dotfiles/p10k.zsh ] && . ~/dotfiles/p10k.zsh
else
    ZSH_THEME="robbyrussell"
fi

. ~/.oh-my-zsh/oh-my-zsh.sh

alias p+=pushd
alias p-=popd

type pbcopy &> /dev/null && alias clip=pbcopy
type xclip &> /dev/null && alias clip=xclip

if [[ -f ~/.vim/bundle/vimpager/vimpager ]]; then
    export vimpager=~/.vim/bundle/vimpager/vimpager
    export PAGER=$vimpager
fi

[[ ! -f ~/google.sh ]] || . ~/google.sh

