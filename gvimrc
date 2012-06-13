call pathogen#runtime_append_all_bundles()

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
syntax on
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"Turn on Autocomplete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" Turn on the WiLd menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.swp,*.bak,*.class
"Always show current position
set ruler
" Height of the command bar
set cmdheight=2
" A buffer becomes hidden when it is abandoned
set hid
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Ignore case when searching
"set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
set ignorecase
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" No annoying sound on errors
set novisualbell
set noerrorbells
set t_vb=
set tm=500
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set encoding=utf-8  "encoding
set showmode
set showcmd         "show incomplete command
set hidden
set wildmode=list:longest
set cursorline
set ttyfast         "smoother changes
set laststatus=2
set nu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

"Autocomplete Key remap
inoremap <D-Space> <C-n>

set nocompatible    "use vim default
set ls=2            "always show status line
set modelines=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space"> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
"map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" jamessan's

set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=[%-1.1n]\                       " buffer number
set statusline+=[MODE:%{HasPaste()}]\           " buffer number
set statusline+=[CWD:%{getcwd()}]\  
set statusline+=%y\                             "filetype
set statusline+=%h                              "help file flag
set statusline+=%m\                             "modified flag
set statusline+=%r                              "read only flag
set statusline+=%=                              " right align
set statusline+=%-10{FileSize()}
set statusline+=%{strlen(&fenc)?&fenc:&enc},    " encoding
set statusline+=%-10.5{&fileformat}\            " file format
set statusline+=%-12.(%l,%c%V%)\ %<%P           " offset

set guifont=Inconsolata:h15
colorscheme Clarity
"Frame layout
"set wrap
set textwidth=78
set formatoptions=qrn1
set colorcolumn=85

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype css,html,xml set listchars-=tab:>.
"set listchars=tab:▸\ ,trail:.,extends:#,nbsp:".
"autocmd filetype html,xml set listchars-=tab:▸\ ,

set foldenable
set foldmethod=manual
let php_folding=0

if has('gui_macvim')
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif


nnoremap / /\v
vnoremap / /\v

map <D-H> <C-w>h
map <D-J> <c-w>j
map <D-K> <c-w>k
map <D-L> <c-w>l

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

nnoremap j gj
nnoremap k gk

nnoremap ; :

"au focuslost * :wa
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
nnoremap <leader>a :ack
nnoremap <leader>s ?{<cr>jv/^\s*\}?$<cr>k:sort<cr>:noh<cr>
nnoremap <leader>q gqip

"Taglist
set tags+=./tags
"set tags+=~/.vim/tags/php_tags

autocmd BufWritePost *.php :TlistUpdate
nnoremap <leader>t :Tlist<CR>
nnoremap <leader>u :TlistUpdate<CR>
nnoremap <leader>s :TlistSessionSave tlist<CR>
nnoremap <leader>l :TlistSessionLoad tlist<CR>

"Command-T
if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    macmenu &Tools.Make key=<nop>
    macmenu &Tools.List\ Errors key=<nop>
    "map <D-t> :CommandT<CR>
    map <D-b> :CommandTBuffer<CR>
    map <D-l> ,lj
endif

map <D-t> ,p

"yank ring
map <D-y>  :YRShow<CR>

let g:CommandTMaxFiles=100
let g:CommandTMaxDepth=10

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
if exists(":Tabularize")
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
"map <leader>gc :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>gr :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
"map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>

"Conque - Shell plugin
noremap <silent> <F1> :ConqueTermTab bash<CR>
" Give a shortcut key to NERD Tree
noremap <silent> <F2> :NERDTreeToggle<CR>
"PHP folding
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>

set pastetoggle=<F10>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE'
    en
    return 'NORMAL'
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif

    if bytes < 1024
        return bytes
    elseif bytes > (1024 * 1024)
        return (bytes /(1024 * 1024)) . "M"
    else
        return (bytes / 1024) . "K"
    endif
endfunction
