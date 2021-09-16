" ------------------------------------------------------------------------------
" Chris2.0 Vim Setup
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
" syntax highlighting
Plug 'elzr/vim-json'

" *** Golang ***
Plug 'fatih/vim-go'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ------------------------------------------------------------------------------
" plugin variables and settings
" ------------------------------------------------------------------------------

" gruvbox (colorscheme)
colorscheme gruvbox

" CtrlP
let g:ctrlp_working_path_mode = 'w' " start search from the cwd
let g:ctrlp_show_hidden = 1         " show hidden dot files
let g:ctrlp_follow_symlinks = 1     " show symlink files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ***********
" *** CoC ***
" ***********

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" autoformat ts,tsx,python imports
autocmd BufWritePre *.tsx,*.ts :silent call CocAction('runCommand', 'tsserver.organizeImports')
autocmd BufWritePre *.py :silent call CocAction('runCommand', 'python.sortImports')

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
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ------------------------------------------------------------------------------
" *** SETTINGS ***
"
" These settings are organized according to the layout visible when running
" the :options command.
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" 2. moving around, searching and patterns
" ------------------------------------------------------------------------------

set nostartofline " keep cursor in same column for long-range motion cmds
set incsearch     " search begins when you type first character
set ignorecase    " ignore case when using a search pattern
set smartcase     " override 'ignorecase' when pattern has uppercase characters

" ------------------------------------------------------------------------------
" 4. displaying text
" ------------------------------------------------------------------------------

set scrolloff=3   " number of screen lines to show around cursor
set number        " show the line number for each line
set cmdheight=2   " give more space for displaying messages

" ------------------------------------------------------------------------------
" 5. syntax, highlighting and spelling
" ------------------------------------------------------------------------------

set background=dark " background color brightness
set hlsearch        " highlight all matches for last used search pattern
set cursorline      " highlight the screen line of the cursor
set colorcolumn=80  " display a line in column 80 to show cutoff

" ------------------------------------------------------------------------------
" 6. multiple windows
" ------------------------------------------------------------------------------

set laststatus=2 " show a status line even if only one vim window
set noshowmode " don't display current mode in status line with airline

" ------------------------------------------------------------------------------
" 10. GUI
" ------------------------------------------------------------------------------

set guifont=Menlo:h12

" ------------------------------------------------------------------------------
" 12. messages and info
" ------------------------------------------------------------------------------

set shortmess+=c " don't pass messages to ins-completion-menu

" ------------------------------------------------------------------------------
" 14. editing text
" ------------------------------------------------------------------------------

set backspace=2           " make backspace work like most other apps
set showmatch             " highlight matching [{()}]

" ------------------------------------------------------------------------------
" 15. tabs and indenting
" ------------------------------------------------------------------------------

set tabstop=2     " number of visual spaces per TAB
set shiftwidth=2  " autoindent indents 2 spaces
set softtabstop=2 " number of spaces in tab when editing
set expandtab     " tabs are spaces
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 " Go
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2 expandtab " Django

" ------------------------------------------------------------------------------
" 18. mapping
" ------------------------------------------------------------------------------

set timeoutlen=1000 ttimeoutlen=0 " eliminate delays when changing modes

" ------------------------------------------------------------------------------
" 19. reading and writing files
" ------------------------------------------------------------------------------

set nobackup " don't keep a backup after overwriting a file
set nowritebackup " don't write a backup file before overwriting a file

" ------------------------------------------------------------------------------
" 20. the swap file
" ------------------------------------------------------------------------------

set noswapfile " don't create any swap files when editing a buffer
set updatetime=300 " shorter updatetime for better user experience (CoC)

" ------------------------------------------------------------------------------
" 22. command line editing
" ------------------------------------------------------------------------------

set wildmenu " visual autocomplete for command menu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux



" ------------------------------------------------------------------------------
" 25. multi-byte characters
" ------------------------------------------------------------------------------

set encoding=utf-8 " character encoding used in Vim
