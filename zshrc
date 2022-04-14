# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
[[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] && . "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

if [[ $OSTYPE == "darwin"* ]]; then
    export PATH=/opt/homebrew/bin:$PATH
    export HOMEBREW_CASK_OPTS="--caskroom=$HOME/.brew/cask/ --appdir=~/Applications"
fi

if [[ $TERM_PROGRAM == "iTerm.app" || $TERM_PROGRAM == "tmux" || $TERM_PROGRAM == "vscode" || ! -z "$WT_SESSION" ]]; then
    ZSH_THEME="powerlevel10k/powerlevel10k"
    POWERLEVEL9K_DISABLE_RPROMPT="true"
    ENABLE_CORRECTION="false"
    COMPLETION_WAITING_DOTS="true"
    
    plugins=(git zsh-autosuggestions zsh-syntax-highlighting fd)

    autoload -U compinit && compinit
    [ -f ~/dotfiles/p10k.zsh ] && . ~/dotfiles/p10k.zsh
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