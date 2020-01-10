"#Plugins will be downloaded under the specified directory.
let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1
call plug#begin('~/.vim/plugged')

let mapleader = "\<Space>"
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
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/Shougo/vimproc.vim', {'do' : 'make'}
Plug 'https://github.com/Quramy/tsuquyomi'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

" Plug 'dense-analysis/ale'
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'javascript': ['eslint'],
            \   'dart': ['dartfmt'],
            \}
let g:ale_linters = {
            \   'dart': ['language_server'],
            \}

let g:ale_fix_on_save = 1

"" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set number
set relativenumber
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>vt :sp ~/.tmux.conf<cr>
" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" typscript-vim config (type :make to compile with ts):
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" vim js pretty template config:
"autocmd FileType typescript JsPreTmpl html
"autocmd FileType typescript syn clear foldBraces

" Polyglote config:
let g:polyglot_disabled = ['typescript']
