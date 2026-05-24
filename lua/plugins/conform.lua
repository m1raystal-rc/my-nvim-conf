return {
	{
		"stevearc/conform.nvim",
		opts = {
			default_format_opts = {
				timeout_ms = 3000,
				async = true, -- non-blocking, eliminates UI freeze/glitch
				quiet = true, -- suppresses notifications, no blue noice popups
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				rust = { "rustfmt" },
				lua = { "stylua" },
				javascript = { "prettier" },
				python = { "black" },
			},
			formatters = {
				rustfmt = {
					prepend_args = { "--config", "tab_spaces=2,hard_tabs=true" },
				},
				stylua = {
					prepend_args = { "--indent-type", "Tabs", "--indent-width", "2" },
				},
				prettier = {
					prepend_args = { "--use-tabs", "--tab-width", "2" },
				},
			},
		},
	},
}
