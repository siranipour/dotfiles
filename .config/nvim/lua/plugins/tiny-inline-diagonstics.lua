return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    virt_texts = {
        priority = 1,
    },
    config = function()
        vim.diagnostic.config({ virtual_text = false })
        require('tiny-inline-diagnostic').setup()
    end
}
