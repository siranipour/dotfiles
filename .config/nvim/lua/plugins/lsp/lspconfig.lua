return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        'saghen/blink.cmp',
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local blink = require("blink-cmp")
        local keymap = vim.keymap


        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d",
                    function() vim.diagnostic.jump({ count = -1, float = true, severity = { min = _G.min_diagnostic_severity } }) end,
                    opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d",
                    function() vim.diagnostic.jump({ count = 1, float = true, severity = { min = _G.min_diagnostic_severity } }) end,
                    opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = blink.get_lsp_capabilities()

        -- Custom diagnostic filter for basedpyright
        local function filter_basedpyright_diagnostics(_, result, ctx, config)
            local filtered = {}
            for _, diag in ipairs(result.diagnostics) do
                if diag.severity == vim.diagnostic.severity.ERROR then
                    table.insert(filtered, diag)
                end
            end
            result.diagnostics = filtered
            vim.lsp.handlers["textDocument/publishDiagnostics"](_, result, ctx, config)
        end

        -- Configure basedpyright specifically with diagnostic filtering
        vim.lsp.config('basedpyright', {
            capabilities = capabilities,
            settings = {
                basedpyright = {
                    analysis = {
                        typeCheckingMode = "off",
                    },
                },
            },
            handlers = {
                ["textDocument/publishDiagnostics"] = filter_basedpyright_diagnostics
            },
        })
    end
}
