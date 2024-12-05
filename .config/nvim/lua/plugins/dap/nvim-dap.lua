return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debugger continue" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debugger step into" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debugger step over" })
		vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Debugger quit" })
		vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debugger restart" })
		vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Debugger step out" })
    end,
}
