vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local wk = require("which-key")
wk.add {
	{ "<leader>]", ":bn<cr>" },
	{ "<leader>[", ":bp<cr>" },
	{ "<leader>lg", "<cmd>LazyGit<cr>", mode = "n" },
	{ "<leader>bd", ":bd<cr>" },
	{ "<leader>fs", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Find in current buffer" },
	{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
	{ "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Find by grep" },
	{ "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Search in buffers" },
	{ "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Search in help" },
}
