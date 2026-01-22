return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
		"jfpedroza/neotest-elixir",
	},
	keys = {
		{ "<leader>tt", function() require("neotest").run.run() end, desc = "Run nearest test" },
		{ "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
		{ "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Show test output" },
		{ "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
	},
	config = function()
		require("neotest").setup {
			adapters = {
				require("neotest-jest") {
					jestCommand = "npx jest",
					cwd = require("neotest-jest").root,
					jest_test_discovery = false,
				},
				require("neotest-elixir") {
					extra_block_identifiers = { "test_with_mock" },
				},
			},
			discovery = {
				enabled = false,
			},
			summary = {
				mappings = {
					attach = "a",
					expand = "l",
					expand_all = "L",
					jumpto = "gf",
					output = "o",
					run = "<C-r>",
					short = "p",
					stop = "u",
				},
			},
			icons = {
				passed = " ",
				running = " ",
				failed = " ",
				unknown = " ",
				running_animated = vim.tbl_map(function(s)
					return s .. " "
				end, { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }),
			},
			diagnostic = {
				enabled = true,
			},
			output = {
				enabled = true,
				open_on_run = "short",
			},
			status = {
				enabled = true,
			},
		}
	end,
}
