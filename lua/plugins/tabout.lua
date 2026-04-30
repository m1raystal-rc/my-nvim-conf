return {
	"abecodes/tabout.nvim",
	config = function()
		require("tabout").setup({
			tabkey = "<Tab>",
			backwards_tabkey = "<S-Tab>",
			act_as_tab = true,
			enable_backwards = true,
		})

		vim.keymap.set("i", "<Tab>", function()
			if vim.snippet and vim.snippet.active() then
				return "<Tab>"
			end

			local line = vim.api.nvim_get_current_line()
			local col = vim.api.nvim_win_get_cursor(0)[2]

			if col >= #line then
				return "<Tab>"
			end

			local after_one = line:sub(col + 1, col + 1)
			--local after_two = line:sub(col + 2, col + 2)

			--if after_one == ")" and after_two == ")" then
			--vim.schedule(function()
			--vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", false)
			--end)
			--return ""
			--end

			if after_one == ")" then
				vim.schedule(function()
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", false)
				end)
				return ""
			end

			return "<Tab>"
		end, { noremap = true, silent = true, expr = true })
	end,
}
