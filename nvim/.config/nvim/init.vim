"setup vim-plug {{{

  "Note: install vim-plug if not present
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif

  "Note: Skip initialization for vim-tiny or vim-small.
  if !1 | finish | endif
  if has('vim_starting')
    set nocompatible               " Be iMproved
    " Required:
    call plug#begin()
  endif

"}}}



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

