return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
        require("oil").setup()
        vim.keymap.set("n", "<leader>o", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
    end
}
