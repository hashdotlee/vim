set encoding=utf-8
set scrolloff=10
set number
set ts=4 sw=4
syntax on
filetype plugin on
colorscheme gruvbox
set background=dark    " Setting dark mode
let g:mapleader = "\<Space>"
noremap <silent> <leader><space> :Files<CR>
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Pr :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
let g:user_emmet_leader_key="\<c-z>"
map <leader>ev :vsp $MYVIMRC<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
augroup ReactFiletypes
	autocmd!
	autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
	autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END
try
	nmap <silent> <F8> :call CocAction('diagnosticNext')<cr>
	command! -nargs=0 OR :silent call CocAction('runCommand', 'editor.action.organizeImport')
endtry
"coc.nvim config
"-----begin-------
"-----------------
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Map Ag search
nnoremap <silent> <leader>s :Ag<CR>
" Map fzf-History 
nnoremap <silent> <leader>h :History<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"------end------
"---------------
call plug#begin('~/.config/nvim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-fugitive'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'github/copilot.vim'
Plug 'terryma/vim-multiple-cursors'
call plug#end()
