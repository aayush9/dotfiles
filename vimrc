set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle.vim

call vundle#begin()
Plugin 'vundlevim/vundle.vim'

Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()

let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm_extra_config.py'
set completeopt-=preview
let g:ycm_warning_symbol = '⚠'
let g:ycm_error_symbol = '✖'
highlight YcmErrorSign ctermfg=1 guifg=#ffaf00

syntax on
set relativenumber
set number
set clipboard=unnamedplus
set mouse=i
set tabstop=4
set autoindent
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set signcolumn=number
set smartcase
set lazyredraw
set backspace=indent,eol,start
filetype plugin indent on

set foldmethod=syntax
set nofoldenable

set t_co=256
set background=dark

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

nmap Q <nop>
nnoremap <C-Left> :tabp<CR>
nnoremap <C-Right> :tabn<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-q> :tabclose<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap jk <Esc>
nmap <A-Up> :m -2<CR>
nmap <A-Down> :m +1<CR>

autocmd BufWinEnter * NERDTreeMirror
autocmd bufenter * if(winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) |q|endif
