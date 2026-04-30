return {
	{
		"hedyhli/outline.nvim",
		config = function()
			require("outline").setup({
				symbols = {
					filter = nil,
				},
				outline_window = {
					width = 16,
				},
			})
			vim.keymap.set("n", "<leader>ol", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
		end,
	},
}
