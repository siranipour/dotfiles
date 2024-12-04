return {
    "folke/zen-mode.nvim",
    config = function()
        require("zen-mode").setup({
            plugins = {
                twilight = { enabled = true },
            },
            on_open = function(win)
                vim.diagnostic.config({ signs = false, virtual_text = false })
            end,
            -- callback where you can add custom code when the Zen window closes
            on_close = function()
                vim.diagnostic.config({ signs = true, virtual_text = true })
            end,
        })
    end
}
