return {
	"gbprod/yanky.nvim",
	opts = {
		vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)"),
		vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
	},
	keys = {
		{ "y", "<Plug>(YankyYank)",      mode = { "n", "x" }, desc = "Yank Text" },
		{ "p", "<Plug>(YankyPutAfter)",  mode = { "n", "x" }, desc = "Put Text After Cursor" },
		{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Cursor" },
	}
	-- keys = {
	-- 	{
	-- 		"<leader>p",
	-- 		require("telescope").extensions.yank_history.yank_history({}),
	-- 		mode = { "n", "x" },
	-- 		desc = "Open Yank History",
	-- 	},
	-- 	-- stylua: ignore
	-- 	{ "gp", "<Plug>(YankyGPutAfter)",                 mode = { "n", "x" },                           desc = "Put Text After Selection" },
	-- 	{ "gP", "<Plug>(YankyGPutBefore)",                mode = { "n", "x" },                           desc = "Put Text Before Selection" },
	-- 	{ "[y", "<Plug>(YankyCycleForward)",              desc = "Cycle Forward Through Yank History" },
	-- 	{ "]y", "<Plug>(YankyCycleBackward)",             desc = "Cycle Backward Through Yank History" },
	-- 	{ "]p", "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put Indented After Cursor (Linewise)" },
	-- 	{ "[p", "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put Indented Before Cursor (Linewise)" },
	-- 	{ "]P", "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put Indented After Cursor (Linewise)" },
	-- 	{ "[P", "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put Indented Before Cursor (Linewise)" },
	-- 	{ ">p", "<Plug>(YankyPutIndentAfterShiftRight)",  desc = "Put and Indent Right" },
	-- 	{ "<p", "<Plug>(YankyPutIndentAfterShiftLeft)",   desc = "Put and Indent Left" },
	-- 	{ ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Indent Right" },
	-- 	{ "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)",  desc = "Put Before and Indent Left" },
	-- 	{ "=p", "<Plug>(YankyPutAfterFilter)",            desc = "Put After Applying a Filter" },
	-- 	{ "=P", "<Plug>(YankyPutBeforeFilter)",           desc = "Put Before Applying a Filter" },
	-- },
}