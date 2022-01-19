set encoding=utf-8
set number
set scrolloff=7
set colorcolumn=120
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
set wrap
set ignorecase
set undofile
set nohlsearch
set termguicolors
filetype indent on


map <Space> <Leader>

" switch between panes
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap = :vsplit<CR>

" switch between tabs
nnoremap <leader>t :tabnew<CR>
nnoremap <C-j> gT
nnoremap <C-k> gT

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" call file explorer
nnoremap <leader>e :Vexplore<CR>


call plug#begin()
Plug 'vim-scripts/RltvNmbr.vim'
"Plug 'roxma/nvim-completion-manager'"
"Plug 'SirVer/ultisnips'"
"Plug 'honza/vim-snippets'"
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'haya14busa/vim-asterisk'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Plug 'neovim/nvim-lspconfig'"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'nightsense/strawberry'
call plug#end()

call RltvNmbr#RltvNmbrCtrl(1)
colorscheme strawberry-dark

":lua require'lspconfig'.pyright.setup{}"
"set completeopt=menuone,noselect"

noremap <C-/> :Comment<CR>

map * <Plug>(asterisk-*)

