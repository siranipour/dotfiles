return {
    "numToStr/FTerm.nvim",
    config = function()
        vim.keymap.set('n', '<C-s>', '<CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle floating terminal" })
        vim.keymap.set('t', '<C-s>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    end
}
