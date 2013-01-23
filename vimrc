" filetype off
filetype plugin indent on
" call pathogen#runtime_append_all_bundles()
" call pathogen#infect()
" call pathogen#helptags()
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" vundle bundles
Bundle 'klen/python-mode'
Bundle 'scrooloose/nerdcommenter'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'filepirate'

syntax on

"general settings
syntax on
set number
"set relativenumber
set nocompatible
set modelines=0
set shell=/bin/bash
set lazyredraw
set matchtime=3
set laststatus=2

"let mapleader = "\"
set title
set mouse=a
colors desert
set cpoptions+=$

"tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

"Make Vim to handle long lines nicely.
set wrap
set textwidth=120
set formatoptions=qrn1
"set colorcolumn=120

"keymappings
imap jj <ESC>
map <C-s> :w<CR>
"bubbling
nmap <C-Up> ddkP
nmap <C-Down> ddp

"bubbling multilines
vmap <C-Up> xkP`[V`]  
vmap <C-Down> xp`[V`]

"easier window navigation  
nmap <C-h> <C-w>h  
nmap <C-j> <C-w>j  
nmap <C-k> <C-w>k  
nmap <C-l> <C-w>l 

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.  
if has("autocmd")  
 augroup myvimrchooks  
  au!  
  autocmd bufwritepost .vimrc source ~/.vimrc  
 augroup END  
endif

"gvim settings
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions+=m
    color ir_black
    set listchars=tab:¿\ ,eol:¬ 
    "set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline\ 10
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

" plugin settings
" Mini Buffer some settigns."
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 0
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"Rope Plugin settings
imap <leader>j <ESC>:RopeGotoDefinition<cr>
nmap <leader>j <ESC>:RopeGotoDefinition<cr>

"Tagbar key bindings."
nmap <leader>l <ESC>:TagbarToggle<cr>
imap <leader>l <ESC>:TagbarToggle<cr>ij"""""
