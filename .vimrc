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

call plug#begin('~/.vim/plugged')

" *** General Plugins ***
" netrw file/folder navigation shortcuts
Plug 'tpope/vim-vinegar'
" allows plugin support for the . command
Plug 'tpope/vim-repeat'
" mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-surround'
" Git
Plug 'tpope/vim-fugitive'
" awesome comment mappings gc and gcc
Plug 'tpope/vim-commentary'
" +/-/~ symbols for Git changes in side gutter
Plug 'airblade/vim-gitgutter'
" fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'
" status/tabline
Plug 'vim-airline/vim-airline'
" autocompleting pairs ({[]})
Plug 'jiangmiao/auto-pairs'
" highlights trailing whitespace characters
Plug 'ntpeters/vim-better-whitespace'
" search through files
Plug 'mileszs/ack.vim'
" colorscheme
Plug 'morhetz/gruvbox'

" *** JavaScript/TypeScript ***
" syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" *** JSON ***
Plug 'elzr/vim-json'

" *** Golang ***
Plug 'fatih/vim-go'

" *** C ***
Plug 'rhysd/vim-clang-format'

" *** Python ***
" autocomplete
Plug 'davidhalter/jedi-vim'
" style linting
Plug 'nvie/vim-flake8'
" style formatting
Plug 'psf/black'

call plug#end()

" ------------------------------------------------------------------------------
" plugin variables and settings
" ------------------------------------------------------------------------------

" CtrlP
let g:ctrlp_working_path_mode = 'w' " start search from the cwd
let g:ctrlp_show_hidden = 1         " show hidden dot files
let g:ctrlp_follow_symlinks = 1     " show symlink files
let g:ctrlp_custom_ignore = 'node_modules\|build'

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" vim-flake8 (python) - Call flake8 for syntax and style checking on save
autocmd BufWritePost *.py call flake8#Flake8()

" psf/black (python) - Auto formatting on save
autocmd BufWritePre *.py execute ':Black'

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

set guifont=Menlo:h12
set scrolloff=3   " number of screen lines to show around cursor
set number        " show the line number for each line

" ------------------------------------------------------------------------------
" syntax, highlighting and spelling
" ------------------------------------------------------------------------------

set background=dark " background color brightness
set hlsearch        " highlight all matches for last used search pattern
set cursorline      " highlight the screen line of the cursor
set colorcolumn=80  " display a line in column 80 to show cutoff
colorscheme gruvbox

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

" ------------------------------------------------------------------------------
" tabs and indenting
" ------------------------------------------------------------------------------

set tabstop=2     " number of visual spaces per TAB
set shiftwidth=2  " autoindent indents 2 spaces
set softtabstop=2 " number of spaces in tab when editing
set expandtab     " tabs are spaces
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 " Go
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2 expandtab " Django

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

