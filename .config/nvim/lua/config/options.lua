vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false -- don't wrap text when overflowing current buffer

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if mixed case is included, assume you want case-sensitive

opt.cursorline = true

-- terminal options
opt.termguicolors = true
opt.background = "dark" -- colorschemes will try to use dark mode
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
vim.diagnostic.config({ severity_sort = true })

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 50 }
  end,
})
