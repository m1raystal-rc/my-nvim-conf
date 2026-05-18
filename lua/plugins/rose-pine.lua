return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		opts = {
			variant = "main",
			dark_variant = "main",
			transparent_background = true,
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
			enable = {
				terminal = true,
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.cmd.colorscheme("rose-pine")

			-- 粉色系自定义
			local pink_colors = {
				Directory = "#FFB5C2", -- 路径/目录
				Keyword = "#D6A2E8", -- 关键字 (if/else/return)
				Function = "#FF99BB", -- 函数名
				String = "#FFB8C6", -- 字符串
				Comment = "#BFA6C2", -- 注释
				Type = "#E8A0BF", -- 类型
				Constant = "#FFC0CB", -- 常量
				Identifier = "#FFB7C5", -- 标识符
			}

			for group, color in pairs(pink_colors) do
				vim.api.nvim_set_hl(0, group, { fg = color })
			end
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "rose-pine",
		},
	},
}
