let g:airline_theme='powerlineish'

function! AirlineThemePatch(palette)
  let a:palette.normal.airline_error = [ '#ffffff', '#ff0000', 232, 92 ]
  let a:palette.insert.airline_error = [ '#ffffff', '#ff0000', 232, 92 ]
  let a:palette.visual.airline_error = [ '#ffffff', '#ff0000', 232, 92 ]
  let a:palette.replace.airline_error = [ '#ffffff', '#ff0000', 232, 92 ]
endfunction

let g:airline_theme_patch_func = 'AirlineThemePatch'

set noshowmode " hide '-- INSERT --' below statusline (redundant)
