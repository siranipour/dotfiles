return {
    "okuuva/auto-save.nvim",
    version = '^1.0.0',
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    keys = {
        { "<leader>x", "<cmd>ASToggle<CR>", desc = "Toggle auto-save" },
    },
    opts = {
        debounce_delay = 100,
        condition = function(buf)
            local filetype = vim.fn.getbufvar(buf, "&filetype")
            if vim.list_contains({ "oil" }, filetype) then
                return false
            end
            return true
        end,
    },
}
