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

local function cycle_diagnostics_display()
    local config = vim.diagnostic.config()
    local current_vt = config.virtual_text == true
    local current_vl = config.virtual_lines == true

    if not current_vt and not current_vl then
        vim.diagnostic.config({
            virtual_text = true,
            virtual_lines = false,

        })
    elseif current_vt and not current_vl then
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = true,
        })
    elseif not current_vt and current_vl then
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = false,

        })
    else
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = false,
        })
    end
end

vim.keymap.set("n", "<localleader>d", cycle_diagnostics_display, { desc = "Cycle diagnostics display (Off > Text > Lines)" })
