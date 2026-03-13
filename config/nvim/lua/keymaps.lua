vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local wk = require("which-key")
wk.add {
	{ "<leader>]", ":bn<cr>" },
	{ "<leader>[", ":bp<cr>" },
	{ "<leader>lg", "<cmd>LazyGit<cr>", mode = "n" },
	{ "<leader>bd", ":bd<cr>" },
	{ "<leader>fs", function() require("telescope.builtin").current_buffer_fuzzy_find() end, name = "Find in current buffer" },
	{ "<leader>ff", function() require("telescope.builtin").find_files() end, name = "Find files" },
	{ "<leader>fg", function() require("telescope.builtin").live_grep() end, name = "Find by grep" },
	{ "<leader>fb", function() require("telescope.builtin").buffers() end, name = "Search in buffers" },
	{ "<leader>fh", function() require("telescope.builtin").help_tags() end, name = "Search in help" },
}
