" Basic settings
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set encoding=UTF-8
set completeopt-=preview " For No Previews

" Plugin setup
call plug#begin()

Plug 'https://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'} " Auto Completion
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/akinsho/toggleterm.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'folke/which-key.nvim' " WhichKey for keybinding hints
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" Key mappings
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nmap <F8> :TagbarToggle<CR>


" Leader key mapping
let mapleader=" "

" Key mappings with Leader
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :wq<CR>
nnoremap <leader>qq :cq<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" Telescope key mappings
nnoremap <leader>f :Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fr :Telescope oldfiles<CR>
nnoremap <leader>fe :Telescope grep_string<CR>

" Format
nmap <silent> <leader><S-f> :call CocAction('runCommand', 'prettier.formatFile')<CR>


" ToggleTerm configuration
let g:toggleterm_terminal_mapping = "<leader>t"
lua << EOF
require("toggleterm").setup{
  open_mapping = [[<leader>t]],
  direction = 'horizontal', -- or 'vertical' or 'float'
}
EOF



" Colorscheme
colorscheme jellybeans

" NERDTree settings
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Airline settings
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '' 

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
