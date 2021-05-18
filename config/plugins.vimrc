" Vim Plug
" Plugins will be downloaded under the specified directory.
" call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.config/vim/plugged')
call plug#begin(has('nvim') ? '~/.config/nvim/plugged' : '~/.config/vim/plugged')

" Declare the list of plugins.
" # Tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" # Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Fetch with CocInstall:
" JSON - coc-json
" Bash - coc-sh
" Emmet - coc-emmet
" or add to CocConfig:
" {
  "languageserver": {
    "go": {
      "command": "gopls",
      "rootPatterns": ["go.mod"],
      "trace.server": "verbose",
      "filetypes": ["go"]
"    }
"  }
"}

"Autocloser
Plug 'Raimondi/delimitMate'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Statusline
Plug 'itchyny/lightline.vim'

" Colorscheme
" Plug 'morhetz/gruvbox'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'owozsh/amora'
Plug 'danilo-augusto/vim-afterglow'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
