return {
	"sudo-tee/opencode.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MeanderingProgrammer/render-markdown.nvim",
	},
	opts = {
		keymap = {
			editor = {
				["<leader>oc"] = { "toggle" }, -- 开关 Opencode 面板
				["<leader>li"] = { "open_input" }, -- 打开输入框
				["<leader>ld"] = { "diff_open" }, -- 查看 AI 修改的差异
				["<leader>ls"] = { "select_session" }, -- 切换会话
				["<leader>op"] = { "configure_provider" },
			},
			input_window = {
				["<cr>"] = { "submit_input_prompt", mode = { "n", "i" } }, -- 提交提示词
				["<C-c>"] = { "cancel" }, -- 停止生成
				["<tab>"] = { "toggle_pane" }, -- 切换输入/输出窗格
			},
		},
	},
}
