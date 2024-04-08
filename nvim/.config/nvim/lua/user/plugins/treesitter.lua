return {
	{
	  "nvim-treesitter/nvim-treesitter",
	  event = { "BufReadPre", "BufNewFile" },
	  build = ":TSUpdate",
	  dependencies = {
		"windwp/nvim-ts-autotag",
	  },
	  config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
		  highlight = {
			enable = true,
		  },
		  indent = {
			  enable = true,
		  },
		  autotag = {
			enable = true,
		  },
		  ensure_installed = {
			"markdown",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"vimdoc",
			"c",
			"cpp",
			"zig",
		  },
		  incremental_selection = {
			enable = true,
			keymaps = {
			  init_selection = "<C-space>",
			  node_incremental = "<C-p>",
			  scope_incremental = false,
			  node_decremental = "<C-n>",
			},
		  },
		})
	  end,
	},
}
