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

call plug#begin()
Plug 'vim-scripts/RltvNmbr.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'

Plug 'nightsense/strawberry'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'neomake/neomake'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:airline_theme='deus'
let g:jedi#completions_enabled = 0 " disable autocompletion, because we use deoplete for completion
"let g:jedi#use_splits_not_buffers = "right" " open the go-to function in split, not another buffer
let g:jedi#goto_command = "gd"
let g:jedi#documentation_command = "gh"

let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

nnoremap <leader>g :TagbarToggle<CR>

call RltvNmbr#RltvNmbrCtrl(1)
" colorscheme strawberry-dark
" instead fix rltvnmbr colors with
source ~/.local/share/nvim/plugged/strawberry/colors/strawberry-dark.vim

" call nerdtree
nnoremap <leader>e :NERDTreeToggle<CR>

" switch between panes
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>t :tabnew<CR>

