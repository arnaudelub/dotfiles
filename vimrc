" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'chiel92/vim-autoformat'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set number
set relativenumber
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
