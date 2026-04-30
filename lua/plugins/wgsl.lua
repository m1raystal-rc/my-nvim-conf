return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if not opts.ensure_installed then
				opts.ensure_installed = {}
			end
			table.insert(opts.ensure_installed, "wgsl")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				wgsl_analyzer = {
					cmd = { "wgsl-analyzer" },
					filetypes = { "wgsl" },
					single_file_support = true,
				},
			},
		},
	},

	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {},
		},
	},
}
