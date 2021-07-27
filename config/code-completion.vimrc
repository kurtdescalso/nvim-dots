" # --------------- Code Completion ---------------
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=yes
  nmap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nmap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" Go to def, vsplit (opens new buffer on right and jumps to it)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>l
" Go to def, hsplit (opens new buffer below and jumps to it)
nmap <silent> gx :sp<CR><Plug>(coc-definition)<C-W>j
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, '× ' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, '• ' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline^=%{FugitiveStatusline()}
set statusline^=%{StatusDiagnostic()}

" Golang format and imports
autocmd BufWritePre *.go :silent :call CocAction('runCommand', 'editor.action.organizeImport')

" Python format
" autocmd BufWritePre *.py execute ':Black'
" autocmd BufWritePre *.py execute ':!autopep8 -i --aggressive --aggressive %'
autocmd FileType python setlocal autoindent noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
let g:formatdef_autopep8="'autopep8 --max-line-length 127 --aggressive --aggressive'"
autocmd BufWritePre *.py execute ':Autoformat'

" Javascript flow
let g:javascript_plugin_flow = 1

" JavaScript spacing
autocmd FileType javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Python detect root for Pyright
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json', 'manage.py']
