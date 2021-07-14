" swap ; and : in normal mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" what is ex mode even used for
nnoremap Q <nop>
" change cwd to cur dir
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" make backspace make sense
set backspace=indent,eol,start
" copypasta with system clipboard
nnoremap <leader>c "+y
vnoremap <leader>c "+y
nnoremap <leader>v "+p
vnoremap <leader>v "+p
map <A-w> <Up>
map <A-a> <Left>
map <A-s> <Down>
map <A-d> <Right>
