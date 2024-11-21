return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
        local snacks = require("snacks")
        snacks.setup({
            dashboard = {
                enabled = true,
                sections = {
                    { section = "header" },
                    { section = "keys", gap = 1, padding = 1 },
                    { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    {
                        pane = 2,
                        icon = " ",
                        title = "Git Status",
                        section = "terminal",
                        enabled = Snacks.git.get_root() ~= nil,
                        cmd = "git status -s",
                        height = 5,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                    { pane = 2, section = "startup" },
                },
            },
            quickfile = { enabled = true },
        })
    end
}
