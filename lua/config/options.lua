-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.listchars = { tab = "|-", trail = "-" }
--vim.o.guifont = "CartographCF Nerd Font:style=Rugular:h10"
-- for nvide
--vim.g.neovide_text_contrast = 0.8
--vim.g.neovide_text_gamma = 1.4
vim.o.winborder = "rounded"
vim.g.neovide_font_antialiasing = "standard"

-- Window
vim.defer_fn(function()
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
end, 50)

-- for the dashboard color
vim.defer_fn(function()
	vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#FFB7C5" })
	vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = "#FFB7C5" })
end, 1)

-- 强制覆盖所有颜色为粉色系（深浅分明版）
vim.defer_fn(function()
	-- 樱花粉色边框
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#FFB7C5" })
	-- 基础高亮组
	vim.api.nvim_set_hl(0, "Keyword", { fg = "#D6A2E8", bold = true }) -- 关键字：浅紫粉（原色）
	vim.api.nvim_set_hl(0, "Function", { fg = "#ff99b1" }) -- 中深粉
	vim.api.nvim_set_hl(0, "Type", { fg = "#ffb3c7" }) -- 中粉
	vim.api.nvim_set_hl(0, "Constant", { fg = "#ffcce7" }) -- 中淡粉
	vim.api.nvim_set_hl(0, "String", { fg = "#ffe6fa" }) -- 淡粉
	vim.api.nvim_set_hl(0, "Identifier", { fg = "#FFCDD6" }) -- 很淡粉
	vim.api.nvim_set_hl(0, "Comment", { fg = "#D4B8C0", italic = true }) -- 灰粉（最淡）
	vim.api.nvim_set_hl(0, "Directory", { fg = "#ff99b1", bold = true })

	-- Treesitter 高亮组
	vim.api.nvim_set_hl(0, "@keyword", { fg = "#D6A2E8", bold = true }) -- 关键字：浅紫粉（原色）
	vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#D6A2E8", bold = true })
	vim.api.nvim_set_hl(0, "@function", { fg = "#ff99b1" }) -- 函数：中深
	vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#ff99b1" })
	vim.api.nvim_set_hl(0, "@function.call", { fg = "#ff99b1" })
	vim.api.nvim_set_hl(0, "@method", { fg = "#ff99b1" })
	vim.api.nvim_set_hl(0, "@method.call", { fg = "#ff99b1" })
	vim.api.nvim_set_hl(0, "@type", { fg = "#ffb3c7" }) -- 类型：中粉
	vim.api.nvim_set_hl(0, "@constant", { fg = "#ffcce7" }) -- 常量：中淡
	vim.api.nvim_set_hl(0, "@string", { fg = "#ffe6fa" }) -- 字符串：淡
	vim.api.nvim_set_hl(0, "@variable", { fg = "#ffcce7" }) -- 变量：很淡
	vim.api.nvim_set_hl(0, "@comment", { fg = "#D4B8Cf", italic = true }) -- 注释：灰粉

	-- 基本数据类型（内置类型）
	vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#ffb3c7", bold = true })
	vim.api.nvim_set_hl(0, "@keyword.type", { fg = "#ffb3c7", bold = true })

	-- 针对常见语言的特定类型
	vim.api.nvim_set_hl(0, "rustType", { fg = "#ffb3c7" }) -- Rust
	vim.api.nvim_set_hl(0, "pythonBuiltin", { fg = "#ffb3c7" }) -- Python
	vim.api.nvim_set_hl(0, "javascriptType", { fg = "#ffb3c7" }) -- JS/TS
	vim.api.nvim_set_hl(0, "typescriptType", { fg = "#ffb3c7" }) -- TypeScript
	vim.api.nvim_set_hl(0, "cType", { fg = "#ffb3c7" }) -- C/C++

	-- C++ 专属高亮补充
	vim.api.nvim_set_hl(0, "@preproc", { fg = "#D6A2E8", bold = true }) -- #include, #define
	vim.api.nvim_set_hl(0, "@keyword.modifier", { fg = "#D6A2E8", bold = true }) -- public, private
	vim.api.nvim_set_hl(0, "@keyword.operator", { fg = "#D6A2E8" }) -- operator 关键字
	vim.api.nvim_set_hl(0, "@type.qualifier", { fg = "#ffb3c7" }) -- const, volatile

	-- 链接子类（保持一致性）
	vim.cmd([[highlight! link @keyword.import @keyword]])
	vim.cmd([[highlight! link @keyword.function @keyword]])
	vim.cmd([[highlight! link @module @variable]])
	vim.cmd([[highlight! link @namespace @variable]])
	vim.cmd([[highlight! link @punctuation @string]])

	-- 普通文字和标题
	vim.cmd([[highlight! Normal guifg=#e0def4]])
	vim.cmd([[highlight! Title guifg=#FF85A1 gui=bold]])

	-- Telescope 匹配高亮（用中深粉醒目）
	vim.cmd([[highlight! TelescopeMatching guifg=#FF85A1 gui=bold]])
end, 300)
