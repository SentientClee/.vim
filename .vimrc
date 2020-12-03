" ------------------------------------------------------------------------------
" Chris2.0 Vim Setup
" These settings are organized according to the layout visible when running
" the :options command.
" ------------------------------------------------------------------------------

filetype plugin indent on  " turn on filetype detection, plugins, and indent
syntax enable              " turn on syntax highlighting
let mapleader = "\<Space>" " map leader key to space

" ------------------------------------------------------------------------------
" Vim package manager
" ------------------------------------------------------------------------------

" Set up vim-plug for vim plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'raimondi/delimitmate'
Plug 'ajh17/vimcompletesme'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'ntpeters/vim-better-whitespace'
Plug 'altercation/vim-colors-solarized'
Plug 'rhysd/vim-clang-format'
Plug 'prettier/vim-prettier'
Plug 'leafgarland/typescript-vim'
Plug 'mileszs/ack.vim'

call plug#end()

" ------------------------------------------------------------------------------
" plugin variables and settings
" ------------------------------------------------------------------------------

" CtrlP
let g:ctrlp_working_path_mode = 'w' " start search from the cwd
let g:ctrlp_root_markers = ['package.json', 'marathon.json', '.ci.sh']
let g:ctrlp_show_hidden = 1         " show hidden dot files
let g:ctrlp_follow_symlinks = 1     " show symlink files
let g:ctrlp_custom_ignore = 'node_modules\|build'

" delimitMate
" <S-Tab> will jump over a single closing delimiter or quote, <C-G>g will jump
" over contiguous delimiters and/or quotes.
let g:delimitMate_expand_cr = 2 " expands carriage returns and auto tabs

" vim-javascript
let g:javascript_plugin_flow = 1 " enable syntax highlighting for flow

" vim-jsx
let g:jsx_ext_required = 0 " Allow jsx syntax support in js files

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ------------------------------------------------------------------------------
" custom leader mappings and settings
" ------------------------------------------------------------------------------

nnoremap <leader>sv :source ~/.vimrc<cr> " shortcut to source .vimrc

nnoremap <C-l> :nohlsearch<CR><C-l> " rm highlighting after searching
autocmd InsertEnter * :setlocal nohlsearch " no highlighting in Insert mode
autocmd InsertLeave * :setlocal hlsearch " enable highlight on Insert leave

" easy shortcut to go to buffer
nnoremap gb :ls<cr>:b<space>

" Block cursor on NORMAL mode, thin cursor on INSERT mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" ------------------------------------------------------------------------------
" moving around, searching and patterns
" ------------------------------------------------------------------------------

set nostartofline " keep cursor in same column for long-range motion cmds
set incsearch     " search begins when you type first character
set ignorecase    " ignore case when using a search pattern
set smartcase     " override 'ignorecase' when pattern has uppercase characters

" ------------------------------------------------------------------------------
" displaying text
" ------------------------------------------------------------------------------

set scrolloff=3   " number of screen lines to show around cursor
set number        " show the line number for each line

" ------------------------------------------------------------------------------
" syntax, highlighting and spelling
" ------------------------------------------------------------------------------

set background=dark " background color brightness
set hlsearch        " highlight all matches for last used search pattern
set cursorline      " highlight the screen line of the cursor
set colorcolumn=80  " display a line in column 80 to show cutoff
colorscheme solarized

" ------------------------------------------------------------------------------
" multiple windows
" ------------------------------------------------------------------------------

set laststatus=2 " show a status line even if only one vim window

" ------------------------------------------------------------------------------
" multiple windows
" ------------------------------------------------------------------------------

set noshowmode " don't display current mode in status line with airline

" ------------------------------------------------------------------------------
" editing text
" ------------------------------------------------------------------------------

set backspace=2           " make backspace work like most other apps
set showmatch             " highlight matching [{()}]
set clipboard=unnamedplus " allows use of the system clipboard

" ------------------------------------------------------------------------------
" tabs and indenting
" ------------------------------------------------------------------------------

set tabstop=2     " number of visual spaces per TAB
set shiftwidth=2  " autoindent indents 2 spaces
set softtabstop=2 " number of spaces in tab when editing
set expandtab     " tabs are spaces
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 " Go specific

" ------------------------------------------------------------------------------
" reading and writing files
" ------------------------------------------------------------------------------

set nobackup " don't keep a backup after overwriting a file

" ------------------------------------------------------------------------------
" mapping
" ------------------------------------------------------------------------------

set timeoutlen=1000 ttimeoutlen=0 " eliminate delays when changing modes

" ------------------------------------------------------------------------------
" the swap file
" ------------------------------------------------------------------------------

set noswapfile " don't create any swap files when editing a buffer

" ------------------------------------------------------------------------------
" command line editing
" ------------------------------------------------------------------------------

set wildmenu " visual autocomplete for command menu
set wildignore+=*.swp

" ------------------------------------------------------------------------------
" multi-byte characters
" ------------------------------------------------------------------------------

set encoding=utf-8 " character encoding used in Vim

