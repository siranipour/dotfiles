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

local diag_display_modes = {
    {
        name = "None",
        config = {
            virtual_text = false,
            virtual_lines = false,
            signs = false,
            underline = false,
        },
    },
    {
        name = "Minimal",
        config = {
            virtual_text = false,
            virtual_lines = false,
            signs = signs,
            underline = true,
        },
    },
    {
        name = "Inline",
        config = {
            virtual_text = true,
            virtual_lines = false,
            signs = signs,
            underline = true,
        },
    },
    {
        name = "Verbose",
        config = {
            virtual_text = false,
            virtual_lines = true,
            signs = signs,
            underline = true,
        },
    },
}

local current_severity_index = #vim.diagnostic.severity
_G.min_diagnostic_severity = vim.diagnostic.severity[current_severity_index]
local current_diag_mode = 2
_G.diagnostic_mode_index = current_diag_mode

local function apply_diagnostic_config()
    local severity = vim.diagnostic.severity[current_severity_index]
    local display = diag_display_modes[current_diag_mode].config

    _G.min_diagnostic_severity = severity
    _G.diagnostic_mode_index = current_diag_mode

    vim.diagnostic.config({
        virtual_text = display.virtual_text and { severity = { min = severity } } or false,
        virtual_lines = display.virtual_lines and { severity = { min = severity } } or false,
        signs = display.signs and vim.tbl_extend("error",
            signs,
            { severity = { min = severity },
            }) or false,
        underline = display.underline and { severity = { min = severity } } or false,
        severity_sort = true,
    })
end

function _G.increase_min_severity()
    current_severity_index = ((current_severity_index - 2) % #vim.diagnostic.severity) + 1
    _G.min_diagnostic_severity = vim.diagnostic.severity[current_severity_index]
    vim.notify("Diagnostic Severity: " .. _G.min_diagnostic_severity)
    apply_diagnostic_config()
end

function _G.toggle_diag_display_mode()
    current_diag_mode = (current_diag_mode % #diag_display_modes) + 1
    _G.diagnostic_mode_index = current_diag_mode
    vim.notify("Diagnostic Mode: " .. diag_display_modes[current_diag_mode].name)
    apply_diagnostic_config()
end

apply_diagnostic_config()

vim.keymap.set("n", "<localleader>D", increase_min_severity,
    { noremap = true, silent = true, desc = "Cycle diagnostic minimum severity" })

vim.keymap.set("n", "<localleader>d", toggle_diag_display_mode,
    { noremap = true, silent = true, desc = "Cycle diagnostic display mode" })
