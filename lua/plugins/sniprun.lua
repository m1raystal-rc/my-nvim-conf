return {
	"michaelb/sniprun",
	build = "sh install.sh", -- 虽然用了本地编译，但保留这个也没问题
	config = function()
		require("sniprun").setup({
			display = {
				"VirtualTextOk", -- 结果显示在行尾
			},
		})

		-- 快捷键映射
		vim.keymap.set("n", "<leader>r", ":SnipRun<CR>", { desc = "Run current line" })
		vim.keymap.set("v", "<leader>r", ":SnipRun<CR>", { desc = "Run visual selection" })
		vim.keymap.set("n", "<leader>R", ":%SnipRun<CR>", { desc = "Run entire file" })
	end,
}
