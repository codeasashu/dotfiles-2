call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-test/vim-test'
Plug 'szw/vim-maximizer'
Plug 'scrooloose/nerdcommenter'
call plug#end()

" #### BASIC USER-DEFINED DEFAULTS ####
" Change mapleader
let mapleader=","

" Use the Solarized Dark theme
set background=dark
colorscheme gruvbox
let g:solarized_termtrans=1

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
if !has('nvim')
  set esckeys
endif
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set nogdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
set smarttab
set cindent
set shiftwidth=2
set expandtab
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" " always show signcolumns
set signcolumn=yes

" #### THEME RELATED ####
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'obsession' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'obsession': 'ObsessionStatus'
      \ },
      \ }

" Find and navigations related
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --follow -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" Faster search
nnoremap <leader>/ :RG 

nmap <Leader>p :GFiles --exclude-standard --others --cached<CR> 

" Maximize in split window settings
nnoremap <silent>++ :MaximizerToggle<CR>
vnoremap <silent>++ :MaximizerToggle<CR>gv
map <silent> <leader><cr> :noh<cr>
" Mapping for moving b/w windows and tabs
nnoremap <Space>j <C-W>j
nnoremap <Space>k <C-W>k
nnoremap <Space>h <C-W>h
nnoremap <Space>l <C-W>l
nnoremap <silent> <leader>b     :<C-u>Buffers<CR>
nmap <Leader>l :Windows<CR>
nmap <Leader>p :GFiles --exclude-standard --others --cached<CR> 
nmap <Leader>o :Files<CR> 
nnoremap <silent> <leader>O     :<C-u>CocCommand fzf-preview.ProjectFiles project_mru git<CR>
nnoremap <silent> <leader>P     :<C-u>FzfPreviewFromResourcesRpc buffer project_mru git<CR>

let g:NERDTreeIgnore = ['^node_modules$', '^venv$']
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
vmap // <plug>NERDCommenterToggle
nmap // <plug>NERDCommenterToggle
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" #### CODE RELATED ####
" Highlight Javascript files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Set marker at column 80
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_documentation()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	filetype plugin on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

let macvim_skip_colorscheme = 1

" #### COC related settings ####
" Coc global extensions
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" instead of having ~/.vim/coc-settings.json
let s:LSP_CONFIG = {
\  'flow': {
\    'command': exepath('flow'),
\    'args': ['lsp'],
\    'filetypes': ['javascript', 'javascriptreact'],
\    'initializationOptions': {},
\    'requireRootPattern': 1,
\    'settings': {},
\    'rootPatterns': ['.flowconfig']
\  }
\}

let s:languageservers = {}
for [lsp, config] in items(s:LSP_CONFIG)
  let s:not_empty_cmd = !empty(get(config, 'command'))
  if s:not_empty_cmd | let s:languageservers[lsp] = config | endif
endfor

if !empty(s:languageservers)
  call coc#config('languageserver', s:languageservers)
  endif

let g:javascript_plugin_flow = 1
let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'basic',
\}

"Add tests
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

