
execute pathogen#infect()
syntax on
filetype plugin indent on

" Changing mapleader has no effect for already defined mappings
:let mapleader = ","

nmap <leader>l :set list!<CR>
nmap <leader>p :set paste!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
