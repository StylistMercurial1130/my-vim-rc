local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

keymap("n","<leader>ls",":Explore<CR>",default_opts)
keymap("n","<leader>vb","<C-v>",default_opts)
keymap("n","<leader>e","$",default_opts)
keymap("n","<leader>s","0",default_opts)
keymap("n","<leader>w",":w<CR>",default_opts)
keymap("n","<leader>q",":q<CR>",default_opts)
keymap("n","<leader>so",":so<CR>",default_opts)
