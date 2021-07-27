" Fuzzy finder: Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
	file_ignore_patterns = {
      "node_modules/.*",
      "__pycache__/.*",
      ".git/.*",
      "plugged/.*",
      "autoload/.*",
	  "python3.*/.*",
	  "bin/.*",
	},
    mappings = {
      i = {
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        -- ["<c-x>"] = false,

        -- Otherwise, just set the mapping to the function that you want it to be.
        -- ["<C-i>"] = actions.select_horizontal,

        -- Add up multiple actions
        -- ["<cr>"] = actions.select_default + actions.center,
        ["<cr>"] = actions.select_default + actions.center,
        ["<c-x>"] = actions.select_horizontal + actions.center,
        ["<c-v>"] = actions.select_vertical + actions.center,

        -- You can perform as many actions in a row as you like
        -- ["<cr>"] = actions.select_default + actions.center + my_cool_custom_action,
      },
    },
  } 
}
EOF
