" Vim Plug
" Plugins will be downloaded under the specified directory.
" call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.config/vim/plugged')
call plug#begin(has('nvim') ? '~/.config/nvim/plugged' : '~/.config/vim/plugged')

" Declare the list of plugins.
" # Tree
" for file icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" # Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Fetch with CocInstall:
" JSON - coc-json
" Bash - coc-sh
" JavaScript - coc-tsserver
" PHP - coc-phpls
" CSS - coc-css
" Emmet - coc-emmet
" Snippets - coc-snippets
" Formatting - coc-prettier
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

" Syntax-highlighting
Plug 'nvim-treesitter/nvim-treesitter'

" Autocloser
Plug 'Raimondi/delimitMate'

" Git
Plug 'tpope/vim-fugitive'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Statusline
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Terminal wrapper
Plug 'akinsho/nvim-toggleterm.lua'

" Colorscheme
" Plug 'morhetz/gruvbox'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'owozsh/amora'
" Plug 'danilo-augusto/vim-afterglow'
Plug 'mhartington/oceanic-next'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
