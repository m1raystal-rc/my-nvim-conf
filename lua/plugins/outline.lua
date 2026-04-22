return {
	{
		"hedyhli/outline.nvim",
		config = function()
			require("outline").setup({
				symbols = {
					filter = nil,
				},
			})
			vim.keymap.set("n", "<leader>ol", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
		end,
	},
}
