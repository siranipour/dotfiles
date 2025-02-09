vim.g.mapleader = " " -- map leader to spacebar

local keymap = vim.keymap

-- mode selection
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- buffer actions
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save buffer" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Exit buffer" })

-- search highlighting
keymap.set("n", "<ESC><ESC>", "<cmd>nohl<CR>", { desc = "Clear search highlight" })

-- disable command history shortcut
vim.api.nvim_set_keymap('n', 'q:', '<Nop>', { noremap = true, silent = true })

-- TODO: add toggle of virtual lines here in new nvim release
-- vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
keymap.set("n", "<leader>h", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    { desc = "Toggle inlay hints" })
