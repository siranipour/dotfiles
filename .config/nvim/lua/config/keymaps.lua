vim.g.mapleader = " " -- map leader to spacebar

local keymap = vim.keymap

-- mode selection
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- buffer actions
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save buffer" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Exit buffer" })

-- search highlighting
keymap.set("n", "<ESC><ESC>", "<cmd>nohl<CR>", { desc = "Clear search highlight" })

-- nerd-tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })                         -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })                     -- collapse file explorer

-- telescope file finding
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Find marks" })
keymap.set("n", "<leader>fy", "<cmd>Telescope neoclip<cr>", { desc = "Find marks" })

-- toggle zen mode
keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle Zen mode" })

-- toggle twilight
keymap.set("n", "<leader>l", "<cmd>Twilight<cr>", { desc = "Toggle Twilight" })
