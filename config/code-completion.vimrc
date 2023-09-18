" # --------------- Code Completion ---------------
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set updatetime=300
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=yes
  nnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : ""
  inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : ""
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! s:CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm()
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
" nnoremap <silent> K :call <SID>ShowDocumentation()<CR>
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
	call CocActionAsync('doHover')
  else
	call feedkeys('K', 'in')
  endif
endfunction

" function! s:ShowDocumentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

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
autocmd BufWritePre *.py execute ':Black'
" autocmd BufWritePre *.py :silent execute ':!autopep8 -i --aggressive --aggressive %'
autocmd FileType python setlocal autoindent expandtab tabstop=4 shiftwidth=4 softtabstop=4
" let g:formatdef_autopep8="'autopep8 --max-line-length 127 --aggressive --aggressive'"
" autocmd BufWritePre *.py execute ':Autoformat'

" Javascript flow
let g:javascript_plugin_flow = 1

" JavaScript spacing
autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Python detect root for Pyright
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json', 'manage.py']
" let g:python3_host_prog = '~/py_proj/nvim_host/bin/python3.10'

" Vue support
autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue

" Rust support
syntax enable
filetype plugin indent on
