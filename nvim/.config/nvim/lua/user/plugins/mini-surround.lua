return {
	{
		"echasnovski/mini.surround",
		version = "*",
		dependencies = {
			{
				"echasnovski/mini.nvim",
				version = "*",
			},
		},
		config = function()
			require("mini.surround").setup()
		end,	
	}
}
