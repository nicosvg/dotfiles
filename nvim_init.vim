call plug#begin('~/.vim/plugged')

Plug 'elixir-editors/vim-elixir'
Plug 'crusoexia/vim-monokai'

call plug#end()

" Browser
"map <C-n> :NERDTreeToggle<CR>
map <C-n> :Vexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" Colors
set termguicolors
syntax on
colorscheme monokai

