return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    config = function()
        vim.diagnostic.config({ virtual_text = false })
        require('tiny-inline-diagnostic').setup({
            options = {
                enable_on_insert = false,
                break_line = {
                    enabled = true,
                    after = 30,
                },
            }
        })
    end
}
