call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dispatch'
" Plug 'jesseleite/vim-agriculture'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
Plug 'junegunn/gv.vim'
Plug 'szw/vim-maximizer'
Plug 'nvie/vim-flake8'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'
Plug 'cespare/vim-toml'
Plug 'vim-test/vim-test'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'editorconfig/editorconfig-vim'
"Plug 'neovim/nvim-lspconfig'
"Plug 'kabouzeid/nvim-lspinstall'

" Terraform related
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'easymotion/vim-easymotion'
"Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Markdown related

" Javascript related plugins
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Reference: https://gist.github.com/codeasashu/c2bf15e44ce6db27d3b4408e808bbd58
" Initialize plugin system
call plug#end()

" Change mapleader
let mapleader=","

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$', '^venv$']

let g:vim_markdown_folding_disabled = 1
let g:javascript_plugin_flow = 1

" s for substitute
"nmap s <plug>(SubversiveSubstitute)
"nmap ss <plug>(SubversiveSubstituteLine)
"nmap S <plug>(SubversiveSubstituteToEndOfLine)
"nmap <leader>s <plug>(SubversiveSubstituteRange)
"xmap <leader>s <plug>(SubversiveSubstituteRange)
"nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

let test#strategy = {
  \ 'nearest': 'neovim',
  \ 'file':    'dispatch',
  \ 'suite':   'basic',
\}


" Use the Solarized Dark theme
set background=dark
colorscheme gruvbox
let g:solarized_termtrans=1

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
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

nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Maximize in split window settings
nnoremap <silent>+ :MaximizerToggle<CR>
vnoremap <silent>+ :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

" Clear search highlights
map <silent> <leader><cr> :noh<cr>

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

" Coc global extensions
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-pyright'
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

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


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

" let g:gitgutter_sign_allow_clobber = 1
" highlight link GitGutterChangeLineNr Underlined
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
"autocmd CursorHoldI * :call <SID>show_documentation()
"autocmd CursorHold * :call <SID>show_documentation()


" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * call CocActionAsync('highlight')

" Highlight Javascript files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nmap <leader>rn <Plug>(coc-rename)

" Code formatting and imports related
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Import :call CocAction('runCommand', 'pyright.organizeimports')
nnoremap <leader>f :<C-u>Format<cr>
nnoremap <leader>i :<C-u>Import<cr>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <space>ss :call StripWhitespace()<CR>

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

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --follow -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" Faster search
nnoremap <silent> <Space>/ :<C-u>FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <leader>/ :RG
nnoremap <silent> <leader>b     :<C-u>Buffers<CR>
nnoremap <silent> <leader>B     :<C-u>FzfPreviewBuffersRpc<CR>
nnoremap <silent> <leader>j :<C-u>FzfPreviewJumpsRpc<CR>
nmap <Leader>l :Windows<CR>
" Non Git files can be simply searched
nmap <Leader>p :GFiles --exclude-standard --others --cached<CR>
nmap <Leader>o :Files<CR>
nnoremap <silent> <leader>O     :<C-u>CocCommand fzf-preview.ProjectFiles project_mru git<CR>
nnoremap <silent> <leader>P     :<C-u>FzfPreviewFromResourcesRpc buffer project_mru git<CR>
" nmap <Leader>/ <Plug>RgRawSearch
" vmap <Leader>/ <Plug>RgRawVisualSelection
" nmap <Leader>* <Plug>RgRawWordUnderCursor

"command! -nargs=* Rg
  "\ call fzf#vim#grep(
  "\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  "\   1,
  "\   {'options': '--delimiter : --nth 2..'})

" ripgrep

" Mapping for moving b/w windows and tabs
nnoremap <Space>j <C-W>j
nnoremap <Space>k <C-W>k
nnoremap <Space>h <C-W>h
nnoremap <Space>l <C-W>l

let g:fzf_preview_buffers_jump = 1
let g:fzf_preview_lines_command = 'bat --color=always --plain --number'
let g:fzf_preview_command = 'bat --color=always --plain {-1}'

nmap <Leader>. [fzf-p]
xmap <Leader>. [fzf-p]


" fzf key bindings
" Easy tab switching
" nnoremap <silent> <Leader>f     :<C-u>FzfPreviewFromResourcesRpc project_mru git<CR>  This is another way of finding files in the project
" Search in git tracked files
" nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatusRpc<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActionsRpc<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChangesRpc<CR>
nnoremap          [fzf-p]f    :<C-u>FzfPreviewProjectGrepRpc<Space>
"xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrepRpc<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
"nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTagsRpc<CR>
"nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFixRpc<CR>
"nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationListRpc<CR>


" Fugitive mapping
nmap <leader>gb :Gblame<cr>
nmap <leader>gc :Git commit<cr>
nmap <leader>gC :Git commit -a -m <cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gg :Ggrep
nmap <leader>gl :Glog<cr>
nmap <leader>gp :Git pull<cr>
nmap <leader>gP :Git push<cr>
nmap <leader>gs :Git<cr>
nmap <leader>gw :Gbrowse<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>g? :map <leader>g<cr>

"Add tests
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" Search and replace highlighted text in visual mode
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>