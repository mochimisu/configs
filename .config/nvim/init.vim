runtime plugins.vim
runtime general.vim
runtime keys.vim
runtime coc.vim
runtime local.vim

lua require('config')

" windows copypaste
if has("win32")
    runtime windows.vim
endif
