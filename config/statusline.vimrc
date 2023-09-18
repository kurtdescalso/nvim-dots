" let g:airline_theme='powerlineish'
let g:airline_theme='luna'

function! AirlineThemePatch(palette)
  let a:palette.normal.airline_error = [ '#ffffff', '#ff0000', 232, 92 ]
  let a:palette.insert.airline_error = [ '#ffffff', '#ff0000', 232, 92 ]
  let a:palette.visual.airline_error = [ '#ffffff', '#ff0000', 232, 92 ]
  let a:palette.replace.airline_error = [ '#ffffff', '#ff0000', 232, 92 ]
endfunction

let g:airline_theme_patch_func = 'AirlineThemePatch'

" Tabline
" set guifont=PowerlineSymbols
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " default means 'off'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = "\ue0b0"
let g:airline#extensions#tabline#left_alt_sep = "\ue0bb"

" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" remove the filetype part
let g:airline_section_x=''
" remove the encoding part
let g:airline_section_y=''
" remove separators for empty sections
let g:airline_skip_empty_sections = 1

" Caches the changes to the highlighting groups, should therefore be faster.
" Set this to one, if you experience a sluggish Vim: >
let g:airline_highlighting_cache = 1

let g:airline_exclude_filetypes = ['NvimTree', 'minimap']

set noshowmode " hide '-- INSERT --' below statusline (redundant)
