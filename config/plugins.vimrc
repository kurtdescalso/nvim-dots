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
" CoC
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

" Python formatter
Plug 'psf/black', { 'branch': 'stable' }
" Plug 'Chiel92/vim-autoformat'

" Additional diagnostics
autocmd BufRead,BufNewFile *.py :silent :execute ":Plug 'iamcco/coc-diagnostic'"

" Syntax-highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Autocloser
Plug 'Raimondi/delimitMate'

" Commenting
Plug 'tpope/vim-commentary'

" Code-folding
" toggling
" Plug 'tmhedberg/SimpylFold' 
" backend
" Plug 'Konfekt/FastFold' 

" Git
Plug 'tpope/vim-fugitive'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Terminal wrapper
" Plug 'akinsho/nvim-toggleterm.lua'

" Colorscheme
" Plug 'morhetz/gruvbox'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'owozsh/amora'
" Plug 'danilo-augusto/vim-afterglow'
" Plug 'mhartington/oceanic-next'

" Percentile scrolloff
Plug 'drzel/vim-scrolloff-fraction'

" Code minimap
Plug 'wfxr/minimap.vim'


" Symbols outline
Plug 'simrat39/symbols-outline.nvim'

" Inline Git blame
Plug 'APZelos/blamer.nvim'

" Colored comments
" Plug 'jbgutierrez/vim-better-comments'

" Colored comments
Plug 'folke/todo-comments.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
