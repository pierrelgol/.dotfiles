return {
	{
	  "numToStr/Comment.nvim",
	  event = {
			"BufReadPre",
			"BufNewFile",
	  },
	  opt = {
	  },
	  config = function()
			require("Comment").setup()
		end,
	},
}
