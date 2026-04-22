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
		{ "<leader>lg", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit (current file repo)" },
	},
	config = function()
		vim.g.lazygit_floating_window_winblend = 15
		vim.g.lazygit_floating_window_scaling_factor = 0.9
	end,
}
