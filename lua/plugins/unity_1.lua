return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		opts = {
			signcolumn = false,
			numhl = true,
			-- word_diff = true,
			current_line_blame = true,
			attach_to_untracked = true,
			preview_config = {
				border = "rounded",
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = "#9ece6a" })
				vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = "#f7768e" })
				vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#7dcfff" })
				vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a6a6a" })

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

        -- Navigation
        -- stylua: ignore
        map("n", "]h", function() if vim.wo.diff then vim.cmd.normal({ "]h", bang = true }) else gitsigns.nav_hunk("next") end end, { desc = "[Git] Next hunk" })
        -- stylua: ignore
        map("n", "]H", function() if vim.wo.diff then vim.cmd.normal({ "]H", bang = true }) else gitsigns.nav_hunk("last") end end, { desc = "[Git] Last hunk" })
        -- stylua: ignore
        map("n", "[h", function() if vim.wo.diff then vim.cmd.normal({ "[h", bang = true }) else gitsigns.nav_hunk("prev") end end, { desc = "[Git] Prev hunk" })
        -- stylua: ignore
        map("n", "[H", function() if vim.wo.diff then vim.cmd.normal({ "[H", bang = true }) else gitsigns.nav_hunk("first") end end, { desc = "[Git] First hunk" })

				-- Actions
				map("n", "<leader>ggs", gitsigns.stage_hunk, { desc = "[Git] Stage hunk" })
        -- stylua: ignore
        map("v", "<leader>ggs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "[Git] Stage hunk (Visual)" })

				map("n", "<leader>ggr", gitsigns.reset_hunk, { desc = "[Git] Reset hunk" })
        -- stylua: ignore
        map("v", "<leader>ggr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "[Git] Reset hunk (Visual)" })

				map("n", "<leader>ggS", gitsigns.stage_buffer, { desc = "[Git] Stage buffer" })
				map("n", "<leader>ggR", gitsigns.reset_buffer, { desc = "[Git] Reset buffer" })

				map("n", "<leader>ggp", gitsigns.preview_hunk, { desc = "[Git] Preview hunk" })
				map("n", "<leader>ggP", gitsigns.preview_hunk_inline, { desc = "[Git] Preview hunk inline" })

        -- map("n", "<leader>ggb", function() gitsigns.blame_line({ full = true }) end, { desc = "[Git] Blame line" })

        -- stylua: ignore
      map("n", "<leader>ggd", gitsigns.diffthis, { desc = "[Git] diff" })
        -- stylua: ignore
      map("n", "<leader>ggD", function() gitsigns.diffthis("~") end, { desc = "[Git] diff (ALL)" })

        -- stylua: ignore
        map("n", "<leader>ggQ", function() gitsigns.setqflist("all") end, { desc = "[Git] Show diffs (ALL) in qflist" })
        -- stylua: ignore
        map("n", "<leader>ggq", gitsigns.setqflist, { desc = "[Git] Show diffs in qflist" })

				-- Text object
				map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "[Git] Current hunk" })

				-- Toggles
				require("snacks")
					.toggle({
						name = "line blame",
						get = function()
							return require("gitsigns.config").config.current_line_blame
						end,
						set = function(enabled)
							require("gitsigns").toggle_current_line_blame(enabled)
						end,
					})
					:map("<leader>tgb")
				require("snacks")
					.toggle({
						name = "word diff",
						get = function()
							return require("gitsigns.config").config.word_diff
						end,
						set = function(enabled)
							require("gitsigns").toggle_word_diff(enabled)
						end,
					})
					:map("<leader>tgw")
			end,
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
			require("scrollbar.handlers.gitsigns").setup()
		end,
	},
	{
		"nvim-mini/mini.diff",
		event = "BufReadPost",
		version = "*",
    -- stylua: ignore
    keys = {
      { "<leader>to", function() require("mini.diff").toggle_overlay(vim.api.nvim_get_current_buf()) end, mode = "n", desc = "[Mini.Diff] Toggle diff overlay", },
    },
		opts = {
			-- Module mappings. Use `''` (empty string) to disable one.
			-- NOTE: Mappings are handled by gitsigns.
			mappings = {
				-- Apply hunks inside a visual/operator region
				apply = "",
				-- Reset hunks inside a visual/operator region
				reset = "",
				-- Hunk range textobject to be used inside operator
				-- Works also in Visual mode if mapping differs from apply and reset
				textobject = "",
				-- Go to hunk range in corresponding direction
				goto_first = "",
				goto_prev = "",
				goto_next = "",
				goto_last = "",
			},
		},
	},
	{
		"petertriho/nvim-scrollbar",
		opts = {},
	},
	{
		"kevinhwang91/nvim-hlslens",
		opts = {},
	},
	{
		"kosayoda/nvim-lightbulb",
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/snacks.nvim" },
			{
				"folke/snacks.nvim",
				opts = {
					terminal = {},
				},
			},
		},
		event = "LspAttach",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"AndreM222/copilot-lualine",
		},
		opts = {
			options = {
				theme = "auto",
				always_divide_middle = false,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = { "encoding", "fileformat", "filetype", "progress" },
				lualine_z = { "location" },
			},
      -- stylua: ignore
      winbar = {
        lualine_a = { "filename", },
        lualine_b = { { function() return " " end, color = "Comment", }, },
        lualine_x = { "lsp_status", },
      },
			inactive_winbar = {
        -- Always show winbar
        -- stylua: ignore
        lualine_b = { function() return " " end, },
			},
		},
		config = function(_, opts)
			local mocha = require("catppuccin.palettes").get_palette("mocha")

			local function show_macro_recording()
				local recording_register = vim.fn.reg_recording()
				if recording_register == "" then
					return ""
				else
					return "󰑋 " .. recording_register
				end
			end

			local macro_recording = {
				show_macro_recording,
				color = { fg = "#333333", bg = mocha.red },
				separator = { left = "", right = "" },
				padding = 0,
			}

			local copilot = {
				"copilot",
				show_colors = true,
				symbols = {
					status = {
						hl = {
							enabled = mocha.green,
							sleep = mocha.overlay0,
							disabled = mocha.surface0,
							warning = mocha.peach,
							unknown = mocha.red,
						},
					},
					spinner_color = mocha.mauve,
				},
			}

			table.insert(opts.sections.lualine_x, 1, macro_recording)
			table.insert(opts.sections.lualine_c, copilot)

			require("lualine").setup(opts)
		end,
	},
	{
		"romgrk/barbar.nvim",
		version = false, -- optional: only update when a new 1.x version is released
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		lazy = false,
    -- stylua: ignore
    keys = {
      { "<A-<>", "<CMD>BufferMovePrevious<CR>", mode = {"n"}, desc = "[Buffer] Move buffer left"  },
      { "<A->>", "<CMD>BufferMoveNext<CR>",     mode = {"n"}, desc = "[Buffer] Move buffer right" },
      { "<A-1>", "<CMD>BufferGoto 1<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 1"    },
      { "<A-2>", "<CMD>BufferGoto 2<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 2"    },
      { "<A-3>", "<CMD>BufferGoto 3<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 3"    },
      { "<A-4>", "<CMD>BufferGoto 4<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 4"    },
      { "<A-5>", "<CMD>BufferGoto 5<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 5"    },
      { "<A-6>", "<CMD>BufferGoto 6<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 6"    },
      { "<A-7>", "<CMD>BufferGoto 7<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 7"    },
      { "<A-8>", "<CMD>BufferGoto 8<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 8"    },
      { "<A-9>", "<CMD>BufferGoto 9<CR>",       mode = {"n"}, desc = "[Buffer] Go to buffer 9"    },
      { "<A-h>", "<CMD>BufferPrevious<CR>",     mode = {"n"}, desc = "[Buffer] Previous buffer"   },
      { "<A-l>", "<CMD>BufferNext<CR>",         mode = {"n"}, desc = "[Buffer] Next buffer"       },
    },
		opts = {
			animation = false,
			-- Automatically hide the tabline when there are this many buffers left.
			-- Set to any value >=0 to enable.
			auto_hide = 1,

			-- Set the filetypes which barbar will offset itself for
			sidebar_filetypes = {
				NvimTree = true, -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
			},
		},
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Toggle undo-tree" },
		},
		init = function()
			vim.cmd([[
      if has("persistent_undo")
         let target_path = expand('~/.undodir')

          " create the directory and any parent directories if the location does not exist.
          if !isdirectory(target_path)
              call mkdir(target_path, "p", 0700)
          endif

          let &undodir=target_path
          set undofile
      endif
      ]])
		end,
	},
	{
		"numToStr/Comment.nvim",
	   -- stylua: ignore
	   keys = {
			-- nah go keymap.lua to find the defination of comment
	     -- { "<leader>/", function() require("Comment.api").toggle.linewise.current() end,                 mode = "n", desc = "[Comment] Comment current line", },
	     -- { "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", mode = "v", desc = "Comment current line",           },
	     -- -- control + / keymappings
	     -- { "<C-_>",     function() require("Comment.api").toggle.linewise.current() end,                 mode = "n", desc = "[Comment] Comment current line", },
	     -- { "<C-_>",     "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", mode = "v", desc = "Comment current line",           },
	   },
		config = true,
	},
	{
		"ibhagwan/smartyank.nvim",
		event = { "BufWinEnter" },
		opts = {
			highlight = {
				timeout = 500, -- timeout for clearing the highlight
			},
			clipboard = {
				enabled = true,
			},
			osc52 = {
				silent = true, -- true to disable the "n chars copied" echo
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "BufReadPost",
		opts = {
			label = {
				rainbow = {
					enabled = true,
					shade = 1,
				},
			},
			modes = {
				char = {
					enabled = false,
				},
			},
		},
		keys = {
      -- stylua: ignore
      { "<leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "[Flash] Jump"              },
      -- stylua: ignore
      { "<leader>F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "[Flash] Treesitter"        },
      -- stylua: ignore
      { "<leader>F", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "[Flash] Treesitter Search" },
      -- stylua: ignore
      { "<leader>fs",     mode = { "c" },           function() require("flash").toggle() end,            desc = "[Flash] Toggle Search"     },
			{
				"<leader>j",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = { mode = "search", max_length = 0 },
						label = { after = { 0, 0 }, matches = false },
						jump = { pos = "end" },
						pattern = "^\\s*\\S\\?", -- match non-whitespace at start plus any character (ignores empty lines)
					})
				end,
				desc = "[Flash] Line jump",
			},
			{
				"<leader>k",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						search = { mode = "search", max_length = 0 },
						label = { after = { 0, 0 }, matches = false },
						jump = { pos = "end" },
						pattern = "^\\s*\\S\\?", -- match non-whitespace at start plus any character (ignores empty lines)
					})
				end,
				desc = "[Flash] Line jump",
			},
		},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/snacks.nvim",
		},
		event = "VeryLazy",
    -- stylua: ignore
    keys = {
      ---@diagnostic disable-next-line: undefined-field
      { "<leader>st", function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME", "BUG", "FIXIT", "HACK", "WARN", "ISSUE"  } }) end, desc = "[TODO] Pick todos (without NOTE)", },
      ---@diagnostic disable-next-line: undefined-field
      { "<leader>sT", function() require("snacks").picker.todo_comments() end, desc = "[TODO] Pick todos (with NOTE)", },
    },
		config = true,
	},

	{
		"nvim-mini/mini.surround",
		version = "*",
		event = "BufReadPost",
		config = true,
		keys = {},
	},

	{
		-- Extend `a`/`i` textobjects
		"nvim-mini/mini.ai",
		version = "*",
		event = "BufReadPost",
		config = true,
	},
}
