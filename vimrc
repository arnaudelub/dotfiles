"#plugins will be downloaded under the specified directory.
let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1
call plug#begin('~/.vim/plugged')

let mapleader = "\<space>"
Plug 'gcmt/taboo.vim'
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
Plug 'quramy/vim-js-pretty-template'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/shougo/vimproc.vim', {'do' : 'make'}
Plug 'https://github.com/quramy/tsuquyomi'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'


" Plug flake8
let python_highlight_all=1
syntax on
"plug 'dense-analysis/ale'
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'javascript': ['eslint'],
            \   'dart': ['dartfmt'],
            \   'java': ['google_java_format'],
            \   'python': ['black']
            \}
let g:ale_linters = {
            \   'dart': [ 'language_server'],
            \   'java': ['checkstyle'],
            \   'python': ['pyls']
            \}

let g:ale_fix_on_save = 1

"" list ends here. plugins become visible to vim after this call.
call plug#end()

set number
set relativenumber
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>vt :sp ~/.tmux.conf<cr>
" automatically rebalance windows on vim resize
autocmd vimresized * :wincmd =
" zoom a vim pane, <c-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" typscript-vim config (type :make to compile with ts):
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd quickfixcmdpost [^l]* nested cwindow
autocmd quickfixcmdpost    l* nested lwindow

" vim js pretty template config:
"autocmd filetype typescript jspretmpl html
"autocmd filetype typescript syn clear foldbraces

" polyglote config:
let g:polyglot_disabled = ['typescript']

" coc vim config:
" if hidden is not set, textedit might fail.
set hidden
"
" " some servers have issues with backup files, see #649
set nobackup
set nowritebackup
"
"" better display for messages
set cmdheight=2

" you will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
"
"" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes"
" "
" "
" " use tab for trigger completion with characters ahead and navigate.
" " use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<c-n>" :
            \ <sid>check_back_space() ? "\<tab>" :
                  \ coc#refresh()
                  inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

                  function! s:check_back_space() abort
                    let col = col('.') - 1
                      return !col || getline('.')[col - 1]  =~# '\s'
                       endfunction
"
"                       " use <c-space> to trigger completion.
                       inoremap <silent><expr> <c-space> coc#refresh()
"
"
"

" Snippets
"
