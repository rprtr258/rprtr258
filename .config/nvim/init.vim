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
set ignorecase
set undofile
set termguicolors
filetype indent on
map <Space> <Leader>

call plug#begin("~/.config/nvim")
Plug 'vim-scripts/RltvNmbr.vim'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nightsense/strawberry'

Plug 'neomake/neomake'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_theme='deus'

let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

nnoremap <leader>g :TagbarToggle<CR>

call RltvNmbr#RltvNmbrCtrl(1)
" colorscheme strawberry-dark
" instead fix rltvnmbr colors with
source ~/.config/nvim/strawberry/colors/strawberry-dark.vim
" colorscheme strawberry-dark

" call nerdtree
map <leader>e :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>

" switch between panes
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>t :tabnew<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

