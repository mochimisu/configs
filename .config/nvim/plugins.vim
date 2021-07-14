function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
" Undo completion
inoremap <expr><C-g> deoplete#mappings#undo_completion()

" Redraw candidates
inoremap <expr><C-l> deoplete#mappings#refresh()

" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
"inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#mappings#manual_complete())

smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#mappings#manual_complete())


call plug#begin()
"Plug 'nanotech/jellybeans.vim'
Plug 'ayu-theme/ayu-vim'

Plug 'Lokaltog/vim-easymotion'
Plug 'bkad/CamelCaseMotion'
Plug 'tomtom/tcomment_vim'
Plug 'benmills/vimux'
Plug 'hynek/vim-python-pep8-indent'
Plug 'mhinz/vim-signify'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'edkolev/tmuxline.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
"Plug '~/.config/nvim/custom/jellybelly.vim'
Plug 'Yggdroot/indentLine'
call plug#end()

" colors/looks {
    " colorscheme {
        "colorscheme jellybelly
        set termguicolors
        let ayucolor="dark"
        colorscheme ayu
        set background=dark
    " }

    " IndentLine {
        let g:indentLine_char = '|'
        let g:indentLine_first_char = '|'
        let g:indentLine_showFirstIndentLevel = 1
        let g:indentLine_setColors = 0
    " }

    " airline {
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_theme = 'jellybeans'
    " }

    " rainbowparenthesis {
        au VimEnter * RainbowParenthesesToggle
        au Syntax * RainbowParenthesesLoadRound
        au Syntax * RainbowParenthesesLoadSquare
        au Syntax * RainbowParenthesesLoadBraces
    " }
" }
"
" Key bindings {
" <leader> is now space
let mapleader = ' '
" }

" Plugin keybinds {
    " easymotion {
        let g:EasyMotion_leader_key = '<leader>'
    " }

    " CamelCaseMotion {
        map <silent> w <Plug>CamelCaseMotion_w
        map <silent> b <Plug>CamelCaseMotion_b
        map <silent> e <Plug>CamelCaseMotion_e
        sunmap w
        sunmap b
        sunmap e
    " }

    " tcomment {
        " toggle comments
        nnoremap <C-l> :TComment<cr>
        vnoremap <C-l> :TComment<cr>
    " }

    " vimux {
        " Prompt for a command to run
        nnoremap <Leader>rc :VimuxPromptCommand<CR>
        " Run last command executed by VimuxRunCommand
        nnoremap <Leader>rl :VimuxRunLastCommand<CR>
        " Inspect runner pane
        nnoremap <Leader>rr   :VimuxInspectRunner<CR>
        " Close vim tmux runner opened by VimuxRunCommand
        nnoremap <Leader>rq :VimuxCloseRunner<CR>
        " Interrupt any command running in the runner pane
        nnoremap <Leader>rx :VimuxInterruptRunner<CR>
    " }
    " fzf {
    nnoremap <C-P> :FZF<cr>
    vnoremap <C-P> :FZF<cr>
    " }
" }
"d

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}

" grepper
nnoremap <leader>git :Grepper -tool git -noswitch<cr>
nnoremap <leader>ag  :Grepper -tool ag  -grepprg ag --vimgrep -G '^.+\.txt'<cr>
nnoremap <leader>*   :Grepper -tool ack -cword -noprompt<cr>
