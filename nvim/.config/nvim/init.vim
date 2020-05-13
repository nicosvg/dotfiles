call plug#begin('~/.vim/plugged')

Plug 'elixir-editors/vim-elixir'
Plug 'crusoexia/vim-monokai'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim' 
"Plug 'tpope/vim-surround'
" Plug 'ctrlpvim/ctrlp.vim', {'on': '<Plug>CtrlP'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'posva/vim-vue'

call plug#end()

" netrw
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_winsize = 25
" map <C-n> :Vexplore<CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" CtrlP
let g:ctrlp_map = '<C-p>' 
let g:ctrlp_cmd = 'CtrlP'

map 0 ^

" Colors
set termguicolors
syntax on
colorscheme monokai

