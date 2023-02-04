set nocompatible

filetype off
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'NLKNguyen/papercolor-theme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/AnsiEsc'
Plugin 'will133/vim-dirdiff'

if filereadable(expand('~/.googlerc'))
  source ~/google.vim
else
  Plugin 'valloric/youcompleteme'
endif

let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm_extra_config.py'
let g:ycm_warning_symbol = '⚠'
let g:ycm_error_symbol = '✖'
set completeopt-=preview
highlight YcmErrorSign ctermfg=1 guifg=#ffaf00

call vundle#end()

syntax on
set number
set relativenumber
set clipboard=unnamedplus
set mouse=i
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set expandtab
set signcolumn=number
set smartcase
set lazyredraw
set backspace=indent,eol,start

set foldmethod=syntax
set nofoldenable

let g:PaperColor_Theme_Options = {
\   'theme': {
\     'default': {
\       'transparent_background': 1
\     }
\   }
\}
colorscheme PaperColor
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
nnoremap <A-Down> :m .+1<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Up> :m '<-2<CR>gv=gv
inoremap jk <Esc>
map <F12> :YcmCompleter GoToDefinition<CR>
map <A-F12> :YcmCompleter GoToReferences<CR>

autocmd BufWinEnter * NERDTreeMirror
autocmd bufenter * if(winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) |q|endif
