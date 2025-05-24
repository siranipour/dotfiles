return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count
        local function jj_status()
            local cmd = [[jj log --revisions @ --no-graph --ignore-working-copy --limit 1 --template '
                            separate(" ",
                              change_id.shortest(),
                              bookmarks,
                              "|",
                              concat(
                                if(conflict, "💥"),
                                if(divergent, "🚧"),
                                if(hidden, "👻"),
                                if(immutable, "🔒"),
                              ),
                              if(empty, "(empty)"),
                              coalesce(
                                truncate_end(29, description.first_line(), "…"),
                                "(no description set)",
                              ),
                            )
                          ' 2>/dev/null]]

            local handle = io.popen(cmd)
            if not handle then return "" end

            local result = handle:read("*a")
            local success = handle:close()

            if not success or result == "" then
                return ""
            end

            return result:gsub("%s+$", ""):gsub("\n", "") -- trim whitespace and newlines
        end
        require("lualine").setup({
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = '#ff9e64' },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
                lualine_c = {
                    'filename',
                    { jj_status, icon = '' },
                    -- 'diff'
                }
            },
        })
    end
}
