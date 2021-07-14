" app settings {
    " terminal colors
    set t_Co=256
    " load vim faster
    set shell=/bin/bash\ -f
    " turn off visuol bell
    set visualbell t_vb=
    " smoother changes
    set ttyfast
    " show title in console bar
    set title
    " modelines for per-document settings
    set modeline
    set modelines=3
    " move backup files to ~/.vim/.backup if possible
    if isdirectory($HOME . '/.vim/.backup') == 0
        :silent !mkdir -p ~/.vim/.backup >/dev/null 2>&1
    endif
    set backupdir-=.
    set backupdir+=.
    set backupdir-=~/
    set backupdir^=~/.vim/.backup/
    set backupdir^=./.vim-.backup/
    set backup
    " }

    " indentation {
    " tab char spaces
    set tabstop=4
    " auto indent spaces
    set shiftwidth=4
    " input tabs to spaces
    set expandtab
    " }

    " navigation {
    " scroll 3 lines at a time
    set scrolloff=3
    " don't jump to the first char when paging
    set nostartofline
    " move freely between files
    set whichwrap=b,s,h,l,<,>,[,]
    " }

    " commands/searching {
    " show status line
    set ls=2
    " show incomplete commands
    set showcmd
    " highlight searches
    set hlsearch
    " incremental searching (as you type)
    set incsearch
    " ignore case while searching
    set ignorecase
    "}

    " visual stuff {
    " show cursor position
    set ruler
    " show line numbers
    set number
    " color the 80 char column
    set colorcolumn=80
    " syntax highlighting
    syntax on
    " show tabs and trailing spaces
    set list listchars=tab:»·,trail:·
    "}
    
    autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
" }
