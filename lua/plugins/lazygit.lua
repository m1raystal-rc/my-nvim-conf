return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		-- 直接使用 LazyGitCurrentFile，它本来就设计为从当前文件目录开始
		{ "<leader>lg", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit (current file repo)" },
		{ "<leader>lf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit (current file)" },
	},
	config = function()
		vim.g.lazygit_floating_window_winblend = 15
		vim.g.lazygit_floating_window_scaling_factor = 0.9
	end,
}
