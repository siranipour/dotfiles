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
    },
}
