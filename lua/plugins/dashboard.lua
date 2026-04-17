return {
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					header = [[
⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷
⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇
⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⣸⢐⢕⢽
⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕
⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕
⡝⡵⠟⠈⠀⠀⠀⠀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⢀⢕
⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄
⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕
⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿
⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟
⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠
⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙
⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣
            _                     _        _ 
  _ __ ___ / |_ __ __ _ _   _ ___| |_ __ _| |
 | '_ ` _ \| | '__/ _` | | | / __| __/ _` | |
 | | | | | | | | | (_| | |_| \__ \ || (_| | |
 |_| |_| |_|_|_|  \__,_|\__, |___/\__\__,_|_|
                        |___/                
          ]],
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{
						pane = 2,
						section = "terminal",
						cmd = "clear",
						height = 20, -- 空白行数
						padding = 0,
					},
					{
						pane = 2,
						section = "terminal",
						cmd = 'clear & fastfetch --logo none --structure "Kernel:Uptime:CPU:GPU:Memory:Swap" | lolcat',
						height = 5,
						width = 80,
						padding = 1,
					},
					{
						pane = 2,
						icon = " ",
						title = "Recent Files",
						section = "recent_files",
						indent = 2,
						padding = 1,
						height = 20,
					},
					{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1, height = 20 },
					{
						pane = 2,
						icon = "☀️ ",
						title = "Daily Challenge",
						section = "terminal",
						cmd = [[
    clear && curl -s 'https://leetcode.com/graphql' \
    -H 'Content-Type: application/json' \
    -d '{"query":"query questionOfToday { activeDailyCodingChallengeQuestion { question { title titleSlug difficulty } } }"}' \
    | jq -r '.data.activeDailyCodingChallengeQuestion.question | "📝 " + .title + "\n📊 Difficulty: " + .difficulty + "\n🔗 https://leetcode.com/problems/" + .titleSlug'
]],
						height = 6,
						padding = 1,
						ttl = 3600, -- 每小时更新一次（因为每日一题每天变一次）
						indent = 2,
						width = 80,
					},
					{ section = "startup" },
				},
			},
		},
	},
}
