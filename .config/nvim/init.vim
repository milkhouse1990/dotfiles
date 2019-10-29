let mapleader=" "
syntax on

set number
set relativenumber

set cursorline
set cursorcolumn

set tabstop=4
set shiftwidth=4

" ========================
" ----- Key bindings -----
" ========================

" ----- NORMAL mode -----

noremap H 7h
noremap L 7l
noremap J 7j
noremap K 7k

map R :source $MYVIMRC<CR>
map s :w<CR>
map Q :q<CR>

map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

map <LEADER>a :vs ~/.config/nvim/init.vim<CR>

map ; :

" ----- INSERT mode -----

" change a1 to a_1 
map <LEADER>q :%s/\(\l\)\(\d\)/\1_\2/g<CR>

" ===============================
" ----- Additional function -----
" ===============================

" Chinese input
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

autocmd InsertLeave * call Fcitx2en()
autocmd InsertEnter * call Fcitx2zh()

" Spell checking
autocmd FileType md setlocal spell

" =================
" ----- Plugs -----
" =================

" ----- vim-plug -----

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" ---- Plug List -----

call plug#begin('~/.config/nvim/plugged')
" New status bar, powerline doesn't work with neovim
Plug 'vim-airline/vim-airline'
Plug 'edkolev/promptline.vim' " export theme for zsh

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'mhinz/vim-signify'

" COMMON LANGUAGES 
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Comments
Plug 'scrooloose/nerdcommenter'

" ()
Plug 'tpope/vim-surround'

" Grammar checking
Plug 'rhysd/vim-grammarous' " Depends on: jre, unzip

" SPECIFIC LANGUAGE
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" TeX
Plug 'lervag/vimtex'

" Matlab
Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }

" Julia
Plug 'JuliaEditorSupport/julia-vim'
Plug 'jpalardy/vim-slime'
call plug#end()

" ----- Plug settings -----

" promoteline
let g:promptline_preset = {
        \'b' : [ promptline#slices#user() ],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

" NERDTree
map tt :NERDTreeToggle<CR>

" ultisnips
" Define where my snippets are.
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" nerdcommenter
let g:NERDSpaceDelims = 1

" -----------------------------------------------

" vimtex
let g:vimtex_compiler_progname = 'nvr'

" julia-vim
autocmd FileType julia nmap <buffer> ? <Plug>(JuliaDocPrompt)
autocmd Filetype julia let g:latex_to_unicode_auto = 1
let g:latex_to_unicode_file_types = ["julia", "markdown"]

" vim-slime
let g:slime_target = "neovim"
