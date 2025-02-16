local toggle_dim = function()
    if require('snacks').dim.enabled then
        require('snacks').dim.disable()
    else
        require('snacks').dim.enable()
    end
end


return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        win = {
            backdrop = false,
        },
    },
    keys = {
        { "<leader>l",   toggle_dim,                                                                        desc = "Toggle dimming scope" },
        { "<leader>z",   function() require('snacks').zen() end,                                            desc = "Toggle zen mode" },
        { "<C-w>m",      function() require('snacks').zen.zoom() end,                                       desc = "Maximize/minimize a split" },
        { "<leader>g",   function() require('snacks').lazygit() end,                                        desc = "Toggle lazygit" },

        { "<leader>ff",  function() require('snacks').picker.files() end,                                   desc = "Files" },
        { "<leader>fF",  function() require('snacks').picker.files({ hidden = true }) end,                  desc = "Files (all)" },
        { "<leader>fr",  function() require('snacks').picker.recent() end,                                  desc = "Recent" },
        { "<leader>fR",  function() require('snacks').picker.recent({ filter = { cwd = true } }) end,       desc = "Recent (cwd)" },
        { "<leader>fb",  function() require('snacks').picker.buffers() end,                                 desc = "Buffers" },
        { "<leader>fB",  function() require('snacks').picker.buffers({ hidden = true, nofile = true }) end, desc = "Buffers (all)" },
        { "<leader>fp",  function() require('snacks').picker.projects() end,                                desc = "Projects" },
        { "<leader>fe",  function() require('snacks').picker.explorer() end,                                desc = "Explorer" },

        { "<leader>fs",  function() require('snacks').picker.grep() end,                                    desc = "Grep" },
        { "<leader>fw",  function() require('snacks').picker.grep_word() end,                               desc = "Visual selection or word (Root Dir)", mode = { "n", "x" } },
        { "<leader>fW",  function() require('snacks').picker.grep_word({ root = false }) end,               desc = "Visual selection or word (cwd)",      mode = { "n", "x" } },

        { "<leader>f:",  function() require('snacks').picker.command_history() end,                         desc = "Command History" },
        { "<leader>fn",  function() require('snacks').picker.notifications() end,                           desc = "Notification History" },
        { "<leader>fl",  function() require('snacks').picker.lines() end,                                   desc = "Buffer Lines" },
        { '<leader>f/',  function() require('snacks').picker.search_history() end,                          desc = "Search History" },

        { "<leader>fg",  function() require('snacks').picker.git_files() end,                               desc = "Find Files (git-files)" },
        { "<leader>fgl", function() require('snacks').picker.git_log() end,                                 desc = "Git Log" },
        { "<leader>fgb", function() require('snacks').picker.git_branches() end,                            desc = "Git branches" },
        { "<leader>fgd", function() require('snacks').picker.git_diff() end,                                desc = "Git Diff (hunks)" },
        { "<leader>fgs", function() require('snacks').picker.git_status() end,                              desc = "Git Status" },
        { "<leader>fgS", function() require('snacks').picker.git_stash() end,                               desc = "Git Stash" },

        { "<leader>fd",  function() require('snacks').picker.diagnostics() end,                             desc = "Diagnostics" },
        { "<leader>fD",  function() require('snacks').picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
        { "gs",          function() require('snacks').picker.lsp_symbols() end,                             desc = "LSP symbols" },
        { "gr",          function() require('snacks').picker.lsp_references() end,                          desc = "LSP references" },
        { "gd",          function() require('snacks').picker.lsp_definitions() end,                         desc = "LSP definitions" },
        { "gt",          function() require('snacks').picker.lsp_type_definitions() end,                    desc = "LSP type definitions" },
        { "gi",          function() require('snacks').picker.lsp_implementations() end,                     desc = "LSP implementations" },

        { '<leader>f"',  function() require('snacks').picker.registers() end,                               desc = "Registers" },
        { "<leader>fi",  function() require('snacks').picker.icons() end,                                   desc = "Icons" },
        { "<leader>fj",  function() require('snacks').picker.jumps() end,                                   desc = "Jumps" },
        { "<leader>fk",  function() require('snacks').picker.keymaps() end,                                 desc = "Keymaps" },
        { "<leader>fm",  function() require('snacks').picker.marks() end,                                   desc = "Marks" },
        { "<leader>fq",  function() require('snacks').picker.qflist() end,                                  desc = "Quickfix List" },
        { "<leader>fu",  function() require('snacks').picker.undo() end,                                    desc = "Undotree" },
        { "<leader>fC",  function() require('snacks').picker.colorschemes() end,                            desc = "Colorschemes" },
        { "<leader>fP",  function() require('snacks').picker() end,                                         desc = "Pickers" },
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
                        enabled = require('snacks').git.get_root() ~= nil,
                        cmd = "git status -sb",
                        height = 5,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                    { pane = 2, section = "startup" },
                },
            },
            picker = {
                enabled = true,
                win = {
                    input = {
                        keys = {
                            ["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
                            ["<C-i>"] = { "toggle_ignored", mode = { "i", "n" } },
                        }
                    }
                }
            },
            bigfile = { enabled = true },
            quickfile = { enabled = true },
            notify = { enabled = true },
            notifier = { enabled = true },
            zen = { enabled = true, win = { backdrop = { transparent = false, blend = 99 } } },
            lazygit = { enabled = true },
            input = { enabled = true },
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
    end
}
