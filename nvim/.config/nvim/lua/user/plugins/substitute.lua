return {
	{
	  "gbprod/substitute.nvim",
	  event = {
			"BufReadPre",
			"BufNewFile",
	  },
	  config = function()
		local substitute = require("substitute")
		substitute.setup()
		local keymap = vim.keymap -- for conciseness

		vim.keymap.set("n", "r", substitute.operator, { desc = "Substitute with motion" })
		vim.keymap.set("n", "rl", substitute.line, { desc = "Substitute line" })
		vim.keymap.set("n", "R", substitute.eol, { desc = "Substitute to end of line" })
		vim.keymap.set("x", "r", substitute.visual, { desc = "Substitute in visual mode" })
	  end,
	}
}
