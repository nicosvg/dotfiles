call plug#begin('~/.vim/plugged')

Plug 'elixir-editors/vim-elixir'
Plug 'crusoexia/vim-monokai'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim' 
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" Browser
map <C-n> :NERDTreeToggle<CR>
" map <C-n> :Vexplore<CR>
" let g:netrw_liststyle = 3
" let g:netrw_winsize = 25

map 0 ^

" Colors
set termguicolors
syntax on
colorscheme monokai

