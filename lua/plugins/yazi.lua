return {
	"mikavilpas/yazi.nvim",
	version = "*", -- 使用最新稳定版
	event = "VeryLazy",
	keys = {
		-- 快捷键：<leader>- 打开 yazi
		{ "<leader>-", "<cmd>Yazi<cr>", desc = "Open yazi at current file" },
		-- 快捷键：<leader>cw 打开当前工作目录
		{ "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open yazi at cwd" },
	},
	opts = {
		-- 浮动窗口透明度（0-100）
		yazi_floating_window_winblend = 15,
		-- 窗口缩放比例
		floating_window_scaling_factor = 0.9,
		-- 边框样式：rounded, single, double, shadow
		yazi_floating_window_border = "rounded",
		-- 关键快捷键提示
		keymaps = {
			show_help = "<f1>",
		},
	},
}
