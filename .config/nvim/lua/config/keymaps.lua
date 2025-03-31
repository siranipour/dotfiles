vim.g.mapleader = " "       -- map leader to spacebar
vim.g.maplocalleader = "\\" -- map localleader to backslash

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

keymap.set("n", "<localleader>h", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    { desc = "Toggle inlay hints" })

local function toggle_diagnostics_display()
    local current_config = vim.diagnostic.config()
    if current_config.virtual_lines then
        vim.diagnostic.config({
            virtual_lines = false,
            virtual_text = true,
        })
    else
        vim.diagnostic.config({
            virtual_lines = true,
            virtual_text = false,
        })
    end
end

vim.keymap.set("n", "<localleader>d", toggle_diagnostics_display, { desc = " Toggle diagnostics display mode" })
