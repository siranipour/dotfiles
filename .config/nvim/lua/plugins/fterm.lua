return {
    "numToStr/FTerm.nvim",
    config = function()
        vim.keymap.set('n', '<C-`>', '<CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle floating terminal" })
        vim.keymap.set('t', '<C-`>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    end
}
