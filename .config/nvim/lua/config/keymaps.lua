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

-- Setup icons for diagnostics
local diagnostic_icons = {
    Error = " ",
    Warn  = " ",
    Hint  = " ",
    Info  = " ",
}

local signs = {
    text = {
        [vim.diagnostic.severity.ERROR] = diagnostic_icons.Error,
        [vim.diagnostic.severity.WARN]  = diagnostic_icons.Warn,
        [vim.diagnostic.severity.HINT]  = diagnostic_icons.Hint,
        [vim.diagnostic.severity.INFO]  = diagnostic_icons.Info,
    },
}

local diagnostic_configs = {
    {
        virtual_text = false,
        virtual_lines = false,
        underline = false,
        signs = false,

    },
    {
        virtual_text = false,
        virtual_lines = false,
        underline = true,
        signs = signs,
    },
    {
        virtual_text = true,
        virtual_lines = false,
        underline = true,
        signs = signs,
    },
    {
        virtual_text = false,
        virtual_lines = true,
        underline = true,
        signs = signs,
    }
}

_G.current_level = 1
local function set_diagnostic(level)
    _G.current_level = level
    vim.diagnostic.config(diagnostic_configs[level])
end

local function increment_diagnostic()
    local level = _G.current_level
    if level + 1 > #diagnostic_configs then
        set_diagnostic(1)
    else
        set_diagnostic(level + 1)
    end
end

set_diagnostic(_G.current_level)
vim.keymap.set("n", "<localleader>d", increment_diagnostic, { desc = "Cycle diagnostics display (Off > Lite > Text > Lines)" })
