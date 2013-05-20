" Forget being compatible with good ol' vi
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to , This is the SPECIAL character for personal commands
let mapleader=","

set encoding=utf-8  " encoding used is UTF-8
set hidden 			" hide buffers instead of closing them
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set number        	" always show line numbers
syntax enable		" enable syntax
set showmode		" show vim mode
set showcmd			" show command
set wildmenu
"set wildmode=list:longest
set ruler			" show ruler
runtime ftplugin/man.vim
set autoindent		" indent automatically
"Configurations I need to check later
set expandtab
set softtabstop=4
"set cursorline
"set ttyfast
"set relativenumber
"set undofile
"set textwidth=85
"nnoremap / /\v
"vnoremap / /\v
set hlsearch		" highlight search terms
set incsearch		" incremental search
set showmatch		" set show matching parenthesis
set ignorecase		" ignore case while searching
set smartcase		" ignore case if search pattern is all lowercase, case-sensitive otherwise
set path=.,..,/usr/include/**,/usr/share/**
set spelllang=en_us
set tabstop=4		" tab is 4 spaces
set shiftwidth=4	" 4 spaces for indentation
set shiftround		" use multiple of shiftwidth when indenting with '<' and 
set autoindent		" always set autoindenting on
set wrap			" wrap lines
set linebreak		" break lines when wrapping
set showbreak=>		" symbol for wrapped lines is =>
"set clipboard=unnamed " share clipboard with mac
set lazyredraw		" Don't update the display while executing macros

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

filetype plugin indent on " indent based on rules for filetype

" Disable arrow keys
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
" Remap jj to Esc in insert mode
inoremap jj <ESC>
" Enable commands with - as well as :
noremap  - :
" Enable jumping between lines when they are wrapped
nnoremap j gj
nnoremap k gk
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Tab key matches bracket pairs
nnoremap <tab> %
vnoremap <tab> %
" Remove search highlights
nmap <silent> <leader><space> :nohlsearch<CR>
" Strip all trailing whitespaces in current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Control+- to navigate forward in the tags stack
map <leader>> <C-]>
map <leader>< <C-t>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Status line
set laststatus=2 " show status line
set statusline=%F%m%r%h%w
set statusline+=\ %#warningmsg#
set statusline+=%*
set statusline+=%=(%{&ff}/%Y)
function WordCount()
  let s:old_status = v:statusmsg
  exe "silent normal g\<c-g>"
  let s:word_count = str2nr(split(v:statusmsg)[11])
  let v:statusmsg = s:old_status
  return s:word_count
endfunction
"set statusline+=%wc:%{WordCount()} " show Word count in status line
set statusline+=\ (line\ %l\/%L,\ col\ %c)

" For editing compatible with other editors - set tw=0 wrap linebreak

" Use the same symbols as TextMate for tabstops and EOLs
if has("gui_running") "Is probably windows
	"colors delek
	"colors darkblue
	colors desert
	"colors koehler
	"colors elflord
	"colors peachpuff
	"colors slate
	
	"Hide Menu and Toolbar
	set guioptions-=m
	set guioptions-=T

	"Hide Scrollbar
	set guioptions-=l
	set guioptions-=L
	set guioptions-=r
	set guioptions-=b

    if has("unix")
	    " set guifont=CodingFontTobi:h12
    else
        "Gui font
        set guifont=CodingFontTobi:h12
    endif
else
	set visualbell           " don't beep
	set noerrorbells         " don't beep

	set listchars=tab:▸\ ,eol:¬
	colors default
	"colors desert
endif

"if $TMUX == ''
    "set clipboard+=unnamed
"endif

func! WordProcessorMode() 
  setlocal formatoptions=1 
  setlocal noexpandtab 
  "setlocal spell spelllang=en_us 
  set thesaurus+=~/.vim/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap 
  setlocal linebreak 
endfu 
com! WP call WordProcessorMode()

"Invisible character colors
highlight NonText guifg=#4a4a22
highlight SpecialKey guifg=#4a4a22
