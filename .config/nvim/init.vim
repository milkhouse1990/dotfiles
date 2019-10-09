let mapleader=" "
syntax on

set number
set relativenumber

set cursorline

set tabstop=4
set shiftwidth=4

noremap H 7h
noremap L 7l
noremap J 5j
noremap K 5k

map R :source $MYVIMRC<CR>
map s :w<CR>
map Q :q<CR>

map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

map <LEADER>a :vs ~/.config/nvim/init.vim<CR>

map ; :

" ===== Plug install =====
" Used for a new machine
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.vim/plugged')
" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'mhinz/vim-signify'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Matlab
Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }

" Julia
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

" ===== Plug settings =====

" NERDTree
map tt :NERDTreeToggle<CR>
