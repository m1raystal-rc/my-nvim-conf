return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			-- 定义彩虹色高亮组
			local colors = {
				"#f7768e", -- red
				"#e0af68", -- orange
				"#7dcfff", -- cyan
				"#9ece6a", -- green
				"#bb9af7", -- purple
				"#ff9e64", -- orange
			}

			-- 创建高亮组
			for i, color in ipairs(colors) do
				vim.api.nvim_set_hl(0, "IndentLine" .. i, { fg = color })
			end

			-- 配置插件
			require("ibl").setup({
				indent = {
					char = "|",
					highlight = {
						"IndentLine1",
						"IndentLine2",
						"IndentLine3",
						"IndentLine4",
						"IndentLine5",
						"IndentLine6",
					},
				},
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
					highlight = "IndentLine2", -- scope 使用彩虹色之一
				},
			})
		end,
	},
}
