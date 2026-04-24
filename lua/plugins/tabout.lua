return {
	"abecodes/tabout.nvim",
	config = function()
		require("tabout").setup({
			tabkey = "<Tab>",
			backwards_tabkey = "<S-Tab>",
			act_as_tab = true,
			enable_backwards = true,
		})

		-- 增强双层括号跳转
		vim.keymap.set("i", "<Tab>", function()
			local line = vim.api.nvim_get_current_line()
			local col = vim.api.nvim_win_get_cursor(0)[2]

			-- 检查光标后是否有两个连续的右括号
			local after_one = line:sub(col + 1, col + 1)
			local after_two = line:sub(col + 2, col + 2)

			-- 如果光标后是右括号，且再后一位也是右括号（双层情况）
			if after_one == ")" and after_two == ")" then
				-- 跳出两层括号
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", false)
				return ""
			end

			-- 普通情况：让 tabout 处理
			local ok = pcall(function()
				require("tabout").tabout()
			end)

			-- 如果 tabout 没有处理，插入普通 Tab
			if not ok then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
			end
			return ""
		end, { noremap = true, silent = true, expr = false })
	end,
}
