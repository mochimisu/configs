" vimrc
" bmwang
" i mean i could split out these things into separate files
" but i am lazy

" vim only
set nocompatible

" NeoBundle Setup
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'


" Plugins {
    " Unite/shougo stuff {
        NeoBundle 'Shougo/unite.vim'
        NeoBundle 'Shougo/vimproc', {
              \ 'build' : {
              \     'windows' : 'make -f make_mingw32.mak',
              \     'cygwin' : 'make -f make_cygwin.mak',
              \     'mac' : 'make -f make_mac.mak',
              \     'unix' : 'make -f make_unix.mak',
              \    },
              \ }
        " Most recently used
        NeoBundle 'Shougo/neomru.vim'
        " Completion (this requires a build of vim with lua)
        NeoBundle 'Shougo/neocomplete.vim'
        " File browser (like NERDTree)
        NeoBundle 'shougo/vimfiler.vim'
    " }

    " Other usability plugins {
        " move around
        NeoBundle 'Lokaltog/vim-easymotion'
        " give vcs diffs in the gutter.
        NeoBundle 'mhinz/vim-signify'
        " linting
        NeoBundle 'scrooloose/syntastic'
        " Comment/uncomment
        NeoBundle "tomtom/tcomment_vim"
    " }

    " Colors and looks {
        " airline status/tabline
        NeoBundle 'bling/vim-airline'
        " color parenthesis
        NeoBundle 'kien/rainbow_parentheses.vim'
        " make tmux's statusline look like vim's
        NeoBundle 'edkolev/tmuxline.vim'
        " a bunch of color schemes
        NeoBundle 'flazz/vim-colorschemes'
    " }
" }

" Plugin settings {
    " unite {
        let bundle = neobundle#get('unite.vim')
        function! bundle.hooks.on_source(bundle)
            call unite#filters#matcher_default#use(['matcher_fuzzy'])
            call unite#filters#sorter_default#use(['sorter_rank'])
            call unite#set_profile('files', 'smartcase', 1)
            call unite#custom#source('line,outline','matchers','matcher_fuzzy')
        endfunction
        let g:unite_data_directory='~/.vim/.cache/unite'
        let g:unite_enable_start_insert=1
        let g:unite_source_history_yank_enable=1
        let g:unite_source_file_rec_max_cache_files=10000000
        let g:unite_source_rec_max_cache_files=500000
        let g:unite_source_history_yank_enable = 1
        let g:unite_prompt='» '

        " neocomplete {
            let g:neocomplete#enable_at_startup = 1
            let g:neocomplete#enable_smart_case = 1
            let g:neocomplete#sources#syntax#min_keyword_length = 3
            let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
            " define keyword
            if !exists('g:neocomplete#keyword_patterns')
                let g:neocomplete#keyword_patterns = {}
            endif
            let g:neocomplete#keyword_patterns['default'] = '\h\w*'
        " }

        " vimfiler {
            " replace the default explorer
            let g:vimfiler_as_default_explorer = 1
        " }
    " }

    " signify {
        " dont overwrite syntastic's gutter stuff
        let g:signify_sign_overwrite = 0
        let g:signify_vcs_list = ['git', 'perforce']
    " }

    " airline {
        let g:airline_left_sep = '▶'
        let g:airline_right_sep = '◀'
        let g:airline_linecolumn_prefix = '¶ '
        let g:airline_branch_prefix = '⎇ '
        let g:airline_paste_symbol = '∥'
    " }

    " syntastic {
        let g:syntastic_enable_signs=1
        let g:syntastic_check_on_open=1
        let g:syntastic_python_checkers = ['pyflakes']
        let g:syntastic_cpp_remove_include_errors = 1
        let g:syntastic_cpp_check_header = 1
    " }

    " colors/looks {
        " airline {
            let g:airline#extensions#tabline#enabled = 1
        " }

        " rainbowparenthesis {
            au VimEnter * RainbowParenthesesToggle
            au Syntax * RainbowParenthesesLoadRound
            au Syntax * RainbowParenthesesLoadSquare
            au Syntax * RainbowParenthesesLoadBraces
        " }
    " }
" }


" Key bindings {
    " <leader> is now space
    let mapleader = ' '

    " Plugin keybinds {
        " unite {
            " Like CtrlP
            nnoremap <C-p> :Unite file_rec/async<cr>
            nnoremap <C-i> :Unite file_mru<cr>
            nnoremap <leader>/ :Unite grep:.<cr>
            nnoremap <leader>y :Unite history/yank<cr>
            nnoremap <leader>s :Unite -quick-match buffer<cr>
        " }

        " neocomplete {
            " (these are pretty much the defaults)
            inoremap <expr><C-g>     neocomplete#undo_completion()
            inoremap <expr><C-l>     neocomplete#complete_common_string()
            " <CR>: close popup and save indent.
            inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
            function! s:my_cr_function()
              return neocomplete#close_popup() . "\<CR>"
              " For no inserting <CR> key.
              "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
            endfunction
            " <TAB>: completion.
            inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
            " <C-h>, <BS>: close popup and delete backword char.
            inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
            inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
            inoremap <expr><C-y>  neocomplete#close_popup()
            inoremap <expr><C-e>  neocomplete#cancel_popup()
        " }

        " vimfiler {
            nnoremap <C-k> :VimFilerExplorer<cr>
        " }

        " easymotion {
            let g:EasyMotion_leader_key = '<leader>' 
        " }

        " tcomment {
            " toggle comments
            nnoremap <C-l> :TComment<cr>
            vnoremap <C-l> :TComment<cr>
        " }
    " }

    " vim keybinds {
        " swap ; and : in normal mode
        nnoremap ; :
        nnoremap : ;
        " what is ex mode even used for
        nnoremap Q <nop>
        " change cwd to cur dir
        nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
        " make backspace make sense
        set backspace=indent,eol,start
    " }
" }

" main vim settings {
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
        " colorscheme
        colorscheme Monokai
        " show tabs and trailing spaces
        set list listchars=tab:»·,trail:·
    " }

    " gui settings (gvim/mvim) {
    if has("gui_running")
        " no toolbar
        set guioptions-=T
        " no scrollbar on the right
        set guioptions-=r
        " no scrollbar on the left
        set guioptions-=L
    endif
    " }
" }

" turn stuff on
filetype plugin on
filetype indent on

