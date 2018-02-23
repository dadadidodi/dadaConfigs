" simple vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode.
set nocompatible
"set encoding=gbk

"Sets how many lines of history VIM has to remeber
set history=1000

set tags=/home/search/zhangping/tags
"Enable filetype plugin 
filetype plugin indent on

"Set to auto read when a file is changed from the outside
set autoread

"Set file encoding
if has("multi_byte")
  "set fileencodings=ucs-bom,utf-8,chinese,gb18030,gb2312,gbk,cp936
  "set fileencodings=cp936,gbk,ucs-bom,utf-8,chinese,gb18030,gb2312
endif
"set fileencodings=utf-8,ucs-bom,chinese,gb18030,gb2312,gbk,cp936

" XXX set clipboard+=unnamed

"Set mapleader
let mapleader = ","

"Fast saving
nmap <leader>w :w!<cr>

"Fast quit
nmap <leader>q :q<cr>

"Fast reload
nmap <leader>s :source ~/.vimrc<cr>
au! BufWritePost vimrc source ~/.vimrc

"Have the mouse enable all the time
"set mouse=a
map <leader>ms :set mouse=a<cr>
map <leader>mu :set mouse=h<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax on

if has("gui_running")
	"No toolbar in GUI VIM
	"set guioptions-=T
else
	"set background=dark
	"colorscheme zellner
endif

map <leader>1 :set syntax=sh<cr>
map <leader>2 :set syntax=c<cr>
map <leader>3 :set syntax=cpp<cr>
map <leader>4 :set syntax=python<cr>
map <leader>5 :set syntax=cfg<cr>
map <leader>$ :syntax sync fromstart<cr>

autocmd BufEnter * :syntax sync fromstart

autocmd BufNewFile,BufRead *.conf set syntax=cfg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ffs=unix,dos

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 5 lines to the curors - when moving vertical.
set so=5

"Turn on Wild menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 1 high
set cmdheight=1

"Show line number
"set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
" XXX set hid

"set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
"set whichwrap+=<,>,h,l
set whichwrap+=<,>

"Ignore case when searching
"set ignorecase

set incsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"Show matching bracets
set showmatch

"blink time (tenths of a second) ..matchtime
set mat=3

"No hightlight search things
"set hlsearch
set nohls

  """"""""""""""""""""""""""""""""""""""""""""
  " Statusline
  """"""""""""""""""""""""""""""""""""""""""""
  "Always hide the statusline
  set laststatus=2

  "Format the statusline
  set statusline=%F%m%r%h%w\ %{strftime(\"%Y/%m/%d-%H:%M\")}\ Line:\%l/%L:%c\ [%p%%]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful ..foldenable,foldlevel
set nofen
nnoremap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set tabstop(ts), softtabstop(sts), shiftwidth(sw), expandtab(et), smarttab(sta)
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
set smarttab
set foldenable 
au FileType html,vim setl et shiftwidth=2 tabstop=2
"au FileType python setl expandtab smarttab shiftwidth=4 tabstop=4
"au FileType c,cpp,java setl shiftwidth=4 tabstop=4
  
set linebreak
set tw=500
set nu
highlight Normal ctermfg=grey ctermbg=black
"set background=dark
  """"""""""""""""""""""""""""""""""""""""""""
  " Indent
  """"""""""""""""""""""""""""""""""""""""""""
  "Auto indent
  set ai

  "Smart indent
  set si

  "Wrap lines
  set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  """"""""""""""""""""""""""""""""""""""""""""
  " Vim Grep
  """"""""""""""""""""""""""""""""""""""""""""    
  let Grep_Skip_Dirs = 'RCS CVS SCCS .svn'

  """"""""""""""""""""""""""""""""""""""""""""
  " File explorer
  """"""""""""""""""""""""""""""""""""""""""""
  "Split vertically
  let g:explVertical=1

  "Hide some files
  let g:explHidefiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$'

  """"""""""""""""""""""""""""""""""""""""""""
  " Minibuffer
  """"""""""""""""""""""""""""""""""""""""""""
  let g:miniBufExplModSelTarget = 1
  let g:miniBufExplorerMoreThanOne = 3
  let g:miniBufExplModSelTarget = 0
  let g:minibufExplUseSingleClick = 1
  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplVSplit = 25
  let g:miniBufExplSplitBelow = 1

  let g:bufExlorerSortBy = "name"
  au BufRead,BufNew :call UMiniBufExplorer
  map <leader>bo :MiniBufExplorer<cr>
  map <leader>bc :CMiniBufExplorer<cr>

  """"""""""""""""""""""""""""""""""""""""""""
  " Tag list (ctags)
  """"""""""""""""""""""""""""""""""""""""""""
  let Tlist_Ctags_Cmd = "/usr/bin/ctags"
  "let Tlist_Sort_Type = "name" "order by
  "let Tlist_Show_Menu = 1 
  let Tlist_Use_Right_Window=1 "split to the left side of the screen
  "let Tlist_Enable_Fold_Column = 0 "Do not show folding tree
  "let Tlist_File_Fold_Auto_Close = 0 "Do not close tags for other files
  "let Tlist_Show_One_Flie = 1 "only display the tag of current file
  "let Tlist_Compart_Format = 1 "show small
  let Tlist_Exist_OnlyWindow = 1 "if you are the last, kill yourself
  "let Tlist_Auto_Open = 1
  map <leader>t :TlistToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileytpe generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  """"""""""""""""""""""""""""""""""""""""""""
  " Python section
  """"""""""""""""""""""""""""""""""""""""""""
  "au FileType python so ~/.vim/syntax/python.vim
  "autocmd FileType python so ~/.vim/plugin/python_fold.vim

  autocmd FileType python setlocal et sta sw=4 sts=4
  autocmd FileType python map <buffer> <F5> :w<cr>:!python %<cr>

  function! Tlist_Auto_Open() range
    let Tlist_Auto_Open = 1
  endfunction
  "au BufNewFile *.py execute ":call Tlist_Auto_Open()<cr>" 

  "fold
  "au BufNewFile,BufRead *.py set foldmethod=indent
  "au BufNewFile,BufRead *.py set foldlevel=3
  
  "autocmd BufNewFile,BufRead *.py set expandtab
  "autocmd BufNewFile,BufRead *.py set smarttab
  
  "Run in the Python interpreter
  function! Python_Eval_VSplit() range
    let src = tempname()
    let dst = tempname()
    execute ": " . a:firstline . "," . a:lastline . "w " . src
    "execute ":!python " . src . " > " . dst
    "execute ":pedit! " . dst
    execute ":!python " . src 
  endfunction
  au FileType python vmap <F6> :call Python_Eval_VSplit()<cr>

  """"""""""""""""""""""""""""""""""""""""""""
  " C/C++ mappings
  """"""""""""""""""""""""""""""""""""""""""""
  "autocmd BufNewFile,BufRead *.c,*cpp set cindent
  autocmd FileType c,cpp set cin noet sta ts=4 sw=4 sts=4
  autocmd FileType c map <buffer> <leader><space> :w<cr>:!gcc -g %<cr>
  autocmd FileType cpp map <buffer> <leader><space> :w<cr>:!g++ -g %<cr>
  autocmd FileType c,cpp map <buffer> <F5> :!./a.out<cr>
  autocmd FileType c,cpp map <buffer> <leader>mk :w<cr>:make<cr>
  autocmd FileType make map <buffer> <leader>mk :w<cr>:make<cr>
  autocmd FileType c,cpp map <buffer> <leader>g :!gdb<cr>

  au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


" end of vimrc
