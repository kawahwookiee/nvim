return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		-- downloads a prebuilt binary or falls back to cargo build
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		debug = { enabled = false },
		git = {
			status_text_color = true,
		},
		layout = {
			height = 0.8,
			prompt_position = "top",
			preview_position = "bottom",
		},
	},
	lazy = false, -- the plugin lazy-initialises itself
	keys = {},
}
