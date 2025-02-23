return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
        require("oil").setup({
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,
            }
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "OilActionsPost",
            callback = function(event)
                if event.data.actions.type == "move" then
                    require('snacks').rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
                end
            end,
        })
        vim.keymap.set("n", "<leader>o", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
    end
}
