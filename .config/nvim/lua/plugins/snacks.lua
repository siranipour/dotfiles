return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        win = {
            backdrop = false,
        },
    },
    config = function()
        local snacks = require("snacks")
        snacks.setup({
            dashboard = {
                enabled = true,
                sections = {
                    { section = "header" },
                    { section = "keys", gap = 1, padding = 1 },
                    { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Git Status",
                        section = "terminal",
                        enabled = Snacks.git.get_root() ~= nil,
                        cmd = "git status -sb",
                        height = 5,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                    { pane = 2, section = "startup" },
                },
                preset = {
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                        { icon = "", key = "t", desc = "Typr", action = ":Typr" },
                        { icon = "", key = "T", desc = "Typr Stats", action = ":TyprStats" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                },
            },
            bigfile = { enabled = true },
            notify = { enabled = true },
            notifier = { enabled = true },
            zen = { enabled = true, win = { backdrop = { transparent = false, blend = 99 } } },
            lazygit = { enabled = true },
            dim = {
                enabled = true,
                scope = {
                    siblings = false,
                },
            },
            indent = {
                enabled = true,
                animate = { duration = { total = 250 } },
                chunk = { enabled = true },
            },
            scroll = {
                enabled = true,
                animate = {
                    duration = { step = 15, total = 100 },
                },
            },
        })
        local toggle_dim = function()
            if Snacks.dim.enabled then
                Snacks.dim.disable()
            else
                Snacks.dim.enable()
            end
        end
        vim.keymap.set("n", "<leader>l", toggle_dim, { desc = "Toggle dimming scope" })
        vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle zen mode" })
        vim.keymap.set("n", "<C-w>m", function() Snacks.zen.zoom() end, { desc = "Maximize/minimize a split" })
        vim.keymap.set("n", "<leader>g", function() Snacks.lazygit() end, { desc = "Toggle lazygit" })
    end
}
