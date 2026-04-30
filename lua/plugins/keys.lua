return {
	"NStefan002/screenkey.nvim",
	config = function()
		require("screenkey").setup({
			win_opts = {
				row = vim.o.lines,
				col = vim.o.columns - 5,
				relative = "editor",
				anchor = "SE",
				width = 50,
				height = 1,
				border = "none", -- 如果喜欢单线边框可以改成 "single"
				style = "minimal",
				focusable = false,
				noautocmd = true,
			},
			-- 显示设置
			clear_after = 5, -- 3秒无操作后清空
			compress_after = 3, -- 连续3个相同按键后缩写
			separator = " ", -- 按键之间的分隔符
			-- 这里补全了默认的特殊按键映射
			keys = {
				["<ESC>"] = "Esc",
				["<SPACE>"] = "␣",
				["<CR>"] = "⏎",
				["<BS>"] = "⌫",
				["<DEL>"] = "Del",
			},
			disable = {
				filetypes = {},
				buftypes = {},
				modes = {},
			},
		})
		-- **关键：配置加载后自动开启插件**
		vim.cmd("Screenkey toggle")
		vim.keymap.set("n", "<Leader>ok", "<cmd>Screenkey toggle<CR>", { desc = "Toggle screenkey" })
	end,
}
