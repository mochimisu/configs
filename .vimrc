"set background=light
"colorscheme solarized
set t_Co=256

filetype plugin on
filetype indent on

set ofu=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"
highlight Pmenu guibg=brown gui=bold

set ls=2       "Show status line
set tabstop=2    "tab char spaces
set shiftwidth=2  "auto indent spaces
set expandtab
set scrolloff=3    "3 lines when: scrolling
set showcmd    "show incomplete commands
set hlsearch    "highlight searches
set incsearch    "incremental searches
set ruler    "show cursor position
set visualbell t_vb=  "turn off visual bell
"set nobackup    "dont keep backup file
set number    "show line numbers
set ignorecase    "ignore case when searching
set title    "show title in console bar
set ttyfast    "smoother changes
set modeline    "last lines in doc set vim mode
set modelines=3    "number of lines checked for modelines
set nostartofline  "don't jump to first char when paging
set whichwrap=b,s,h,l,<,>,[,]  "move freely between files


set cc=80 "color columns  > 80 letters

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

map ,cd :cd %:p:h<CR>:pwd<CR>  ",cd for current dir
map ,fixtab :%s/\t/  /g<CR> "fix tabs
map ,ws :%s/\s\+$//<CR> "remove whitespace

syntax on    "syntax highlighting
map <F1> :previous<CR>  "F1 -> Previous buffer
map <F2> :next<CR>  "F2 -> Next buffer

let g:lucius_style= "light"
colorscheme bombat

if has("gui_running")
"let g:lucius_style= "dark"
set transparency=10
set guioptions-=T "No toolbar
"set guioptions-=r "No scrollbar on right
set guioptions-=L "No scrollbar on left
set list listchars=tab:»·,trail:· " Display tabs and trailing whitespac
endif


runtime plugin/RainbowParenthsis.vim "syntax on overrides rainbow paren 
let g:syntastic_enable_signs=1              " syntastic
