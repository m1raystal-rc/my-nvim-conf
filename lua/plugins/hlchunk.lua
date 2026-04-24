return {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				delay = 0,
				duration = 0,
				style = "#f5c2e7",
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "┌",
					left_bottom = "└",
					right_arrow = ">",
				}, -- use_treesitter = true,
			},
			indent = {
				enable = false,
			},
		})
	end,
}
