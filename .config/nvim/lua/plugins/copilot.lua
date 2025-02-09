return {
    "github/copilot.vim",
    enabled=false,
    config = function()
        vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("")', {
            expr = true,
            replace_keycodes = false
        })
        vim.g.copilot_no_tab_map = true
    end,
}
