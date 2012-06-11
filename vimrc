call pathogen#runtime_append_all_bundles()
syntax on
filetype on
filetype plugin on

"Turn on Autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"Autocomplete Key remap
inoremap <D-Space> <C-x><C-o>

set nocompatible    "use vim default
set ls=2            "always show status line
set modelines=0

"tab
set smartindent
set ai
set tabstop=4       "numbers of spaces of tab char
set shiftwidth=4    "numbers of spaces when autoindenting
set softtabstop=4
set expandtab       "use spaces instead of <tab>

set encoding=utf-8  "encoding
set showmode
set showcmd         "show incomplete command
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast         "smoother changes
set ruler           "show the cursor position always
set backspace=indent,eol,start
set laststatus=2
set undofile
set nu

"Search
"set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"Frame layout
"set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set list
set listchars=tab:▸\ ,eol:¬

set foldenable
set foldmethod=manual
let php_folding=0 

if has('gui_macvim')
    set guifont=Inconsolata:h15
    colorscheme Clarity 
    set go-=T
    macm Tools.List\ Errors key=<nop>
endif

let mapleader = ","

nnoremap / /\v
vnoremap / /\v

"does not work why?
map <D-H> <C-w>h
map <D-J> <C-w>j
map <D-k> <C-w>k
map <D-L> <C-w>l

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"no direction key
"nnoremap <up> <nop>    
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap ; :

"au FocusLost * :wa
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>A :Ack
nnoremap <leader>V vatzf
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>q gqip
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"Fuzzy Finder
nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,ft :FufTaggedFile<CR>

"Taglist
set tags+=~/.vim/tags/php_tags/tags
nnoremap <leader>t :Tlist<CR>
nnoremap <leader>u :TlistUpdate<CR>
nnoremap <leader>s :TlistSessionSave tlist<CR>
nnoremap <leader>l :TlistSessionLoad tlist<CR>
" set the names of flags
let tlist_php_settings = 'php;c:class;f:function;d:constant'
" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 1
" width of window
let Tlist_WinWidth = 40
" close tlist when a selection is made
let Tlist_Close_On_Select = 1

inoremap jj <ESC>

"Mark-Down
noremap <leader>mc :%! /usr/local/bin/Markdown.pl --html4tags<CR>

"NERNTree
let NERDTreeWinPos = "right"
"let loaded_nerd_tree = 1

"Tabular
let mapleader=','
if exists(":Tabularize")
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
endif

"MRU
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix 

"Conque - Shell plugin
noremap <silent> <F1> :ConqueTermTab bash<CR>
" Give a shortcut key to NERD Tree
noremap <silent> <F2> :NERDTreeToggle<CR>
"yank ring
noremap <silent> <F9> :YRShow<CR> 
"PHP folding
map <F5> <Esc>:EnableFastPHPFolds<Cr> 
map <F6> <Esc>:EnablePHPFolds<Cr> 
map <F7> <Esc>:DisablePHPFolds<Cr> 
"MRU - check syntax
noremap <silent> <F10> :MRU<CR>
