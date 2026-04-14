return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = true,
			term_colors = true,
			integrations = {
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				lazy = true,
				lsp_trouble = true,
				mason = true,
				mini = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				noice = true,
				notify = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		},
		-- 修正：config 不需要额外参数，opts 会自动传入
		config = function()
			-- opts 已经通过上面的 opts 字段自动应用了
			-- 只需要强制覆盖背景透明
			vim.defer_fn(function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
			end, 50)
		end,
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
