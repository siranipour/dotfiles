return {
    "yetone/avante.nvim",
    enabled = false,
    event = "VeryLazy",
    lazy = false,
    version = '*',
    opts = {
        provider = "gemini",
        openai = {
            endpoint = "https://api.openai.com/v1",
            model = "gpt-4o",
            timeout = 30000,
            temperature = 0,
            max_tokens = 4096,
        },
        gemini = {
            endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
            model = "gemini-1.5-flash-latest",
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 4096,
        },
    },
    build = "make",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
