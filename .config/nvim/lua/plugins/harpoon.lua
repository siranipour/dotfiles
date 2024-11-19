return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require('harpoon')

        -- define visual settings for harpoon tabline
        local background_color = "#222436"
        local inactive = "#737aa2"
        local active = "#9CDCFE"
        vim.api.nvim_set_hl(0, "HarpoonInactive", { fg = inactive, bg = background_color })
        vim.api.nvim_set_hl(0, "HarpoonNumberInactive", { fg = inactive, bg = background_color })
        vim.api.nvim_set_hl(0, "HarpoonActive", { fg = active, bg = background_color })
        vim.api.nvim_set_hl(0, "HarpoonNumberActive", { fg = active, bg = background_color })
        vim.api.nvim_set_hl(0, "TabLineFill", { fg = background_color, bg = background_color })

        function Harpoon_files()
            local contents = {}
            local marks_length = harpoon:list():length()
            local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
            for index = 1, marks_length do
                local harpoon_file_path = harpoon:list():get(index).value

                local label = ""
                if vim.startswith(harpoon_file_path, "oil") then
                    local dir_path = string.sub(harpoon_file_path, 7)
                    dir_path = vim.fn.fnamemodify(dir_path, ":.")
                    label = '[' .. dir_path .. ']'
                elseif harpoon_file_path ~= "" then
                    label = vim.fn.fnamemodify(harpoon_file_path, ":t")
                end

                label = label ~= "" and label or "(empty)"
                if current_file_path == harpoon_file_path then
                    contents[index] = string.format("%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ", index, label)
                else
                    contents[index] = string.format("%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ", index, label)
                end
            end

            return "󰀱" .. table.concat(contents)
        end

        require('lualine').setup({
            sections = {
                lualine_x = { { Harpoon_files } },
            },
        })

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
            { desc = "Apply harpoon to current location" })
        vim.keymap.set("n", "<leader>t", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Open harpoon window" })

        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
        vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
        vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
        vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
        vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        -- open harpoons with splits
        harpoon:extend({
            UI_CREATE = function(cx)
                vim.keymap.set("n", "<C-v>", function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-x>", function()
                    harpoon.ui:select_menu_item({ split = true })
                end, { buffer = cx.bufnr })
            end,
        })

        vim.keymap.set("n", "<leader>fh", function() toggle_telescope(harpoon:list()) end,
            { desc = "Open harpoons with telescope" })
    end
}
