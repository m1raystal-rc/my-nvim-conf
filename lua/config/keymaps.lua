-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--vim.keymap.set("n", "<leader>r", ":SnipRun<CR>", { desc = "Run current line" })
--vim.keymap.set("v", "<leader>r", ":SnipRun<CR>", { desc = "Run visual selection" })
--vim.keymap.set("n", "<leader>R", ":%SnipRun<CR>", { desc = "Run entire file" })

--fix c+/ open terminal
-- Map Ctrl+/ to open terminal
vim.o.shell = "/usr/bin/fish"
vim.keymap.set({ "n", "t" }, "<C-/>", function()
	local dir = vim.fn.expand("%:p:h")
	if dir == "" then
		dir = vim.fn.getcwd()
	end
	Snacks.terminal(nil, { cwd = dir })
end, { desc = "Open terminal in current file's directory" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })

require("mini.surround").setup({
	mappings = {
		add = "gsa",
		delete = "gsd",
		replace = "gsr",
	},
})

vim.keymap.set("v", "<C-\\>", "gc", { desc = "Toggle comment on selection", remap = true })
vim.keymap.set("n", "<C-\\>", "gcc", { desc = "Toggle comment current line", remap = true })

vim.keymap.set("i", "qq", "<Esc>", { noremap = true })

vim.keymap.set("n", "Q", "<Nop>", { desc = "Disabled" })
vim.keymap.set("v", "Q", "<Nop>", { desc = "Disabled" })
