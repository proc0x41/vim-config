" ─── Plugin Manager ─────────────────────────────────────────────────
call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'                          " Dark theme for readability
" Language support and syntax
Plug 'sheerun/vim-polyglot'                     " Syntax for multiple languages
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP + autocompletion
" Productivity
Plug 'tpope/vim-commentary'                     " Comment with gcc
Plug 'tpope/vim-surround'                       " Edit (), '', [] easily
Plug 'jiangmiao/auto-pairs'                     " Auto-close (), {}, [], '', etc.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim'                         " FZF integration
Plug 'preservim/nerdtree'                       " File explorer
Plug 'vim-airline/vim-airline'                  " Modern status line
Plug 'vim-airline/vim-airline-themes'           " Status line themes
" Language-specific
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go development
Plug 'pangloss/vim-javascript'                  " Enhanced JS/React support
Plug 'mxw/vim-jsx'                              " JSX/React syntax
Plug 'hashivim/vim-terraform'                   " Terraform support (optional)

call plug#end()

" ─── General Settings ──────────────────────────────────────────────
set encoding=utf-8
set fileencoding=utf-8
set termguicolors
colorscheme gruvbox
set background=dark
syntax enable
set number
set relativenumber
set cursorline
set scrolloff=8
set signcolumn=yes
set mouse=a
set nowrap
set hidden
set nobackup
set nowritebackup
set updatetime=100                      " Faster Coc.nvim response
set shortmess+=c
set cmdheight=1
set foldmethod=indent                   " Fold based on indentation
set foldlevelstart=99                   " Start with all folds open

" ─── Search ────────────────────────────────────────────────────────
set ignorecase
set smartcase
set incsearch
set hlsearch

" ─── Indentation ───────────────────────────────────────────────────
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" ─── Leader Mappings ───────────────────────────────────────────────
let mapleader=" "

" File operations
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
" File navigation
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>b :Buffers<CR>
" Buffer navigation
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
" Tab navigation
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tt :tab split<CR>
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>th :tabprevious<CR>
" Clear search highlights
nnoremap <leader>h :nohlsearch<CR>
" Source vimrc
nnoremap <leader>s :source $MYVIMRC<CR>
" Plugin updates
nnoremap <leader>u :PlugUpdate<CR>
" Toggle fold
nnoremap <leader>z za

" ─── Coc.nvim ──────────────────────────────────────────────────────
" Autocomplete with Tab/S-Tab
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" Confirm completion with Enter
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Show documentation
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
" Format code
nnoremap <leader>F :call CocActionAsync('format')<CR>
" Code actions
nmap <leader>ca <Plug>(coc-codeaction)
" Diagnostics navigation
nmap <silent> <leader>dj :CocNext<CR>
nmap <silent> <leader>dk :CocPrev<CR>
nmap <silent> <leader>dl :CocList diagnostics<CR>
" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Coc extensions for language support
let g:coc_global_extensions = [
  \ 'coc-pyright',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-go',
  \ 'coc-clangd',
  \ 'coc-sh'
  \ ]
" Extensions:
" - coc-pyright: Python LSP
" - coc-tsserver: JavaScript/TypeScript/React LSP
" - coc-json: JSON LSP
" - coc-go: Go LSP
" - coc-clangd: C/C++ LSP
" - coc-sh: Bash LSP

" ─── Language-Specific Settings ────────────────────────────────────
" Python
autocmd FileType python setlocal tabstop=4 shiftwidth=4
" JavaScript/React/JSX
autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal tabstop=2 shiftwidth=2
" Go
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
" C/C++
autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2
" Bash
autocmd FileType sh setlocal tabstop=2 shiftwidth=2

" ─── Go Settings ───────────────────────────────────────────────────
let g:go_fmt_command = "goimports"              " Auto-import on save
let g:go_highlight_types = 1                    " Highlight types
let g:go_highlight_functions = 1                " Highlight functions
let g:go_highlight_methods = 1                  " Highlight methods
" Go-specific mappings
autocmd FileType go nmap <leader>t :GoTest<CR>
autocmd FileType go nmap <leader>b :GoBuild<CR>

" ─── C/C++ Settings ────────────────────────────────────────────────
" Format with clang-format
autocmd FileType c,cpp nnoremap <buffer><leader>F :call CocActionAsync('format')<CR>

" ─── Airline Settings ──────────────────────────────────────────────
let g:airline_theme='gruvbox'                   " Match gruvbox theme
let g:airline_powerline_fonts=1                 " Use powerline symbols
let g:airline#extensions#coc#enabled=1          " Show Coc.nvim status
let g:airline#extensions#tabline#enabled=1      " Show tabs in airline

" ─── FZF Settings ──────────────────────────────────────────────────
" Configure FZF to open at the bottom, like the command-line/mode indicator
let g:fzf_layout = { 'down': '40%' }

" Configure :Files to search only in the current directory (non-recursive)
function! s:SearchCurrentDir(bang)
  let l:dir = getcwd()
  if !isdirectory(l:dir)
    echohl WarningMsg
    echom "Error: Current directory is invalid"
    echohl None
    return
  endif
  call fzf#vim#files(l:dir, {'source': 'find . -maxdepth 1 -type f -not -path "*/\.git/*"'}, a:bang)
endfunction

command! -bang -nargs=? Files call s:SearchCurrentDir(<bang>0)

" ─── Performance ───────────────────────────────────────────────────
set lazyredraw
set ttyfast
set synmaxcol=200                       " Limit syntax highlighting for long lines

" ─── Files ─────────────────────────────────────────────────────────
set noswapfile
set undofile
let &undodir = expand('~/.vim/undodir')
if !isdirectory(&undodir)
  silent! call mkdir(&undodir, 'p', 0700)
endif
