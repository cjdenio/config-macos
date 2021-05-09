"
"
" PLUGINS
"
"
call plug#begin(stdpath('data') . '/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'bkad/CamelCaseMotion'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/argtextobj.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'

Plug 'wakatime/vim-wakatime'

Plug 'sheerun/vim-polyglot'

Plug 'adelarsq/vim-matchit'

Plug 'mg979/vim-visual-multi'

call plug#end()

"
"
" CONFIRUGATION
"
"
colorscheme dracula " Color theme
set nu rnu          " Line numbers
set ignorecase      " Case-insensitive searches
set cursorline      " Highlight the line under the cursor
set mouse=a         " Mouse support
set termguicolors

"
"
" KEYBINDINGS
"
"
let mapleader = " "
nnoremap <leader>fs :w<CR>
nnoremap <Leader>h :noh<CR>
autocmd BufNewFile,BufRead *.java nnoremap <buffer>
                  \ <Leader>d :bel 15split term://./gradlew build
                  \ <Bar> wincmd k<CR>
nnoremap <silent> <expr> <Leader><Leader>
                  \ (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

" coc-related keybindings
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)

"
"
" PLUGIN CONFIG
"
"
let g:camelcasemotion_key = '<leader>'

let NERDTreeWinPos="right"
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

let g:pear_tree_repeatable_expand = 0

let g:startify_change_to_dir = 0

" Autoformat with :Neoformat
augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

autocmd BufWinEnter * silent NERDTreeMirror

"
"
" CUSTOM COMMANDS
"
"
command! -bar Lazygit tabedit term://lazygit | startinsert
command! -bar BelTerm belowright 15split +term
command! -bar VTerm belowright vsplit +term
command! -bar TTerm tabedit +term

command! -range=1 Term
      \ BelTerm
      \ | let num = 0
      \ | while num <= <count> - 2
      \ |   let num = num + 1
      \ |   VTerm
      \ | endwhile
      \ | wincmd k

"
"
" OTHER (stuff i'm too lazy to categorize)
"
"

" Automatically source .vim files on save
autocmd BufWritePost *.vim source %

" Set JSON for CapRover and Prettier config files
autocmd BufNewFile,BufRead captain-definition,.prettierrc set ft=json

" Open NERDTree and Startify on Vim open
autocmd VimEnter *
      \   if !argc()
      \ |   Startify
      \ |   NERDTree
      \ |   wincmd w
      \ | endif

autocmd TermOpen * setlocal nonumber norelativenumber nocursorline

map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>
