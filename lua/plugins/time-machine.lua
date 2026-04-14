return {
	{
		"y3owk1n/time-machine.nvim",
		version = "*", -- 使用稳定版本
		cmd = "TimeMachineToggle", -- 懒加载，提高启动速度
		keys = {
			{ "<leader>tt", "<cmd>TimeMachineToggle<cr>", desc = "Toggle Time Machine" },
		},
		---@type TimeMachine.Config
		opts = {
			-- 你可以在这里自定义配置，例如 diff_tool = "diff" 等
		},
	},
}
