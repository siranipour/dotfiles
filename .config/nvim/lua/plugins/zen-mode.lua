return {
    "folke/zen-mode.nvim",
    setup = function()
        require("zen-mode").setup({
            plugins = {
                twilight = { enabled = true },
            },
        })
    end
}
