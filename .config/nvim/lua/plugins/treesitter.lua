return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-ts-autotag").setup()
        require("nvim-treesitter.configs").setup({
            -- enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- enable indentation
            indent = { enable = true },
            ensure_installed = {
                "html",
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "css",
                "markdown",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "c",
                "python",
                "rust",
                "go",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end
}
