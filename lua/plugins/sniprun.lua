return {
	"michaelb/sniprun",
	build = "sh install.sh", -- 虽然用了本地编译，但保留这个也没问题
	config = function()
		require("sniprun").setup({
			display = {
				"VirtualTextOk", -- 结果显示在行尾
			},
		})
	end,
}
