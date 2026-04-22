-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- sniprun
vim.keymap.set("n", "<leader>r", ":SnipRun<CR>", { desc = "Run current line" })
vim.keymap.set("v", "<leader>r", ":SnipRun<CR>", { desc = "Run visual selection" })
vim.keymap.set("n", "<leader>R", ":%SnipRun<CR>", { desc = "Run entire file" })

--fix c+/ open terminal
-- Map Ctrl+/ to open terminal
vim.keymap.set({ "n", "t" }, "<C-/>", function()
	Snacks.terminal()
end, { desc = "Open terminal" })

-- Map Ctrl+\ to toggle comments (replaces Ctrl+/)
vim.keymap.set("n", "<C-\\>", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Comment current line" })

vim.keymap.set("v", "<C-\\>", function()
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Comment visual selection" })
