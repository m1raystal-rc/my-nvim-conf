return {
	"soulis-1256/eagle.nvim",
	opts = {
		border = "rounded",
	},
	config = function()
		require("eagle").setup({})
		vim.o.mousemoveevent = true
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "Hover Documentation" })
	end,
}
