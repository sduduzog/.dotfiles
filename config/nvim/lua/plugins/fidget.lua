return {
	"j-hui/fidget.nvim",
	version = "*",
	config = function()
		require("fidget").setup {
			progress = {
				display = {
					done_ttl = 1,
				},
			},
			integration = {
				["nvim-tree"] = {
					enable = false,
				},
			},
		}
	end,
}
