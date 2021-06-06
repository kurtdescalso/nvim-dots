let g:airline_theme='powerlineish'

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

set noshowmode " hide '-- INSERT --' below statusline (redundant)
