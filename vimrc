
execute pathogen#infect()
syntax on
filetype plugin indent on

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set number
set hidden
highlight LineNr ctermfg=grey
set hlsearch

" Changing mapleader has no effect for already defined mappings
:let mapleader = ","

nmap <leader>l :set list!<CR>
nmap <leader>p :set paste!<CR>
nmap <leader>h :set hlsearch!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Ctrl-u will start a new change
" this helps prevent the accidental loss of input from insert mode
inoremap <c-u> <c-g>u<c-u>

" Change the background color beyond column 110
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Set tabstop, softtabstop and shiftwidth to the same value
" Drew Neil http://vimcasts.org
" http://vimcasts.org/episodes/tabs-and-spaces/
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
