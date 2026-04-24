return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	ft = { "rust" },
	config = function()
		vim.g.rustaceanvim = {
			tools = {
				rust_analyzer = function()
					return {
						cmd = { "rust-analyzer" },
					}
				end,
			},
			server = {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = { command = "clippy" },
					},
				},
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
				end,
			},
		}
	end,
}
