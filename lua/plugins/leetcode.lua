return {
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
			--"rcarriga/nvim-notify",
		},
		opts = {
			lang = "rust",
			site = "cn",
		},
		keys = {
			{ "<leader>ll", "<cmd>Leet<cr>", desc = "Open LeetCode" },
			{ "<leader>lt", "<cmd>Leet test<cr>", desc = "Test Solution" },
			{ "<leader>ls", "<cmd>Leet submit<cr>", desc = "Submit Solution" },
		},
	},
}
