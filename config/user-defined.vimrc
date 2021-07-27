" # --------------- User-defined ---------------
set clipboard+=unnamedplus
set number
set shiftwidth=4
set tabstop=4

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

nnoremap <SPACE> <Nop>
let mapleader = " "

" # Macros
" Wrapping
" - wrap highlighted text in double quotes
let @s="s\"\"hp"
" - wrap line double quotes
map <Leader>s 0v$h@s
" - wrap highlighted text in parens
let @p="s\(\)hp"

" Possessive form
" - insert missing apostrophe (for words ending with 's' and 'not' contractions)
let @o="ei'b"
" - transform simple past tense to s-form present ('ed' to 's')
let @m="eh2ss"
" - transform past tense to s-form present (e.g., 'ded' to 's')
map <Leader>m e2h3ss
" - transform 'singular noun with possessive verb' to 'plural noun with no-s verb'
map <Leader>p easex 

" Italics
" - markdown: italicize highlighted text by _wrapping underscores_
let @i="s__hp"
" - markdown: italicize line by _wrapping underscores_
map <Leader>i 0v$hs__hp

" Newline
" - insert newline below and go back to normal mode
map <Leader>o ok

" Replace highlighted but retain cut buffer
map <Leader>r "_dhp

" Navigate to buffer
nnoremap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Navigate between tabs
nmap <leader>w :tabp <CR>
nmap <leader>e :tabn <CR>
