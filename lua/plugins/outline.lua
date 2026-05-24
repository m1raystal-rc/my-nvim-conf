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
					auto_fold = false,
					auto_unfold = false,
				},
				-- 添加错误处理
				on_attach = function(bufnr)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-w>h", "", {
						callback = function()
							pcall(vim.cmd, "wincmd h")
						end,
						noremap = true,
						silent = true,
					})
				end,
			})
			vim.keymap.set("n", "<leader>ol", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
		end,
	},
}
