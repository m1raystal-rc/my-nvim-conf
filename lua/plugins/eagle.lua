return {
	"soulis-1256/eagle.nvim",
	opts = {
		border = "rounded",
		border_color = "#FFB7C5", -- pink border
	},
	config = function(_, opts) -- accept opts from lazy.nvim
		require("eagle").setup(opts) -- pass opts, not {}
		vim.o.mousemoveevent = true
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "Hover Documentation" })
	end,
}
