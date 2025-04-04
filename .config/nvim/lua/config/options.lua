vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4       -- 4 spaces for tabs
opt.shiftwidth = 4    -- 4 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- one status line across all splits
opt.laststatus = 3

-- automatically update when file changes on disk
opt.autoread = true

-- center cursor
opt.scrolloff = 999

opt.wrap = false -- don't wrap text when overflowing current buffer

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if mixed case is included, assume you want case-sensitive

opt.cursorline = true

-- terminal options
opt.termguicolors = true
opt.background = "dark"  -- colorschemes will try to use dark mode
opt.signcolumn = "yes:2" -- show sign column so that text does not shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window right
opt.splitbelow = true -- split horizontal window below

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- turn off swapfile
opt.swapfile = false

-- ruler to suggest line break
opt.colorcolumn = "+1,100"

-- enable spellchecking
opt.spelllang = 'en_gb'
opt.spell = true

-- show diagnostics in order of severity
vim.diagnostic.config({ virtual_text = true, severity_sort = true, float = { border = "rounded" } })

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('highlight_yank', {}),
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 50 }
    end,
})


-- Setup icons for DAP (Debug Adapter Protocol)
local dap_icons = {
    Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
    Breakpoint          = " ",
    BreakpointCondition = " ",
    BreakpointRejected  = { " ", "DiagnosticError" },
    LogPoint            = ".>",
}

-- Define DAP signs
for name, icon in pairs(dap_icons) do
    if type(icon) == "table" then
        vim.fn.sign_define("Dap" .. name, { text = icon[1], texthl = icon[2], linehl = icon[3] or "" })
    else
        vim.fn.sign_define("Dap" .. name, { text = icon, texthl = "DiagnosticInfo" })
    end
end
