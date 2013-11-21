filetype off
filetype plugin indent on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'xolox/vim-misc'
Bundle 'Python-mode-klen'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/syntastic'
Bundle 'fholgado/minibufexpl.vim'
"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/gundo.vim'
Bundle 'xolox/vim-easytags'
Bundle 'repeat.vim'
Bundle 'ctrlp.vim'
Bundle 'abolish.vim'
Bundle 'dhazel/conque-term'
Bundle 'fugitive.vim'

"general settings
syntax on
set number
set relativenumber
set nocompatible
set modelines=0
set shell=/bin/bash
set lazyredraw
set matchtime=3
set laststatus=2
set encoding=utf-8
set nobackup
if has("gui_running")
endif

"setlocal spell spelllang=en_us

"statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let mapleader = "\"
set title
set mouse=a
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
set colorcolumn=120

"keymappings
imap jj <ESC>
"save
map <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>
" open new window
nnoremap <leader>w <C-w>v<C-w>l

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

"relative numbers toggle
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <F6> :call NumberToggle()<cr>

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.  
if has("autocmd")  
 augroup myvimrchooks  
  au!  
  autocmd bufwritepost .vimrc source ~/.vimrc  
 augroup END  
endif
set statusline=%<%F%h%m%r%h%w%y\ %{fugitive#statusline()}\ lin:%l\,%L\ col:%c%V\ %P

"gvim settings
if has("gui_running")
    colors solarized
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions+=m
    set listchars=tab:¿\ ,eol:¬ 
    "set guifont=Meslo\ LG\ L\ for\ Powerline\ 9
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
    set guifont=Inconsolata\ for\ Powerline\ Medium\ 11
    let g:Powerline_symbols = 'fancy'
else
    colors zellner
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

" Mapping to NERDTree
nnoremap <C-n> :NERDTreeToggle<cr>

"python-mode settings
let g:pymode_lint_checker = "pyflakes,pep8"
"syntastic settings (syntax checker)
"let g:syntastic_cpp_compiler_options = '-std=c++0x'
let g:syntastic_auto_loc_list=1

"gundo settings
nnoremap <F5> :GundoToggle<CR>

"Conque settings
let g:ConqueTerm_Color = 0

"ctags
let g:easytags_cmd = '/usr/bin/ctags'
set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_auto_highlight = 0
