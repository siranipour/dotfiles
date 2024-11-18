return {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
        require('treesitter-context').setup({
            max_lines = 3,        -- How many lines the window should span. Values <= 0 mean no limit.
            trim_scope = 'inner', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode = 'topline',     -- Line used to calculate context. Choices: 'cursor', 'topline'
        })
    end
}
