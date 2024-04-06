return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-smart-history.nvim" },
	},
	lazy = true,
	event = "VeryLazy",
	config = function()
		local actions = require("telescope.actions")

		-- touch smart-history dbfile
		local db_path = vim.fn.stdpath("data") .. "/databases"
		os.execute("mkdir -p " .. db_path)

		-- setup
		require("telescope").setup({
			defaults = {
				history = {
					path = db_path .. "/telescope_history.sqlite3",
					limit = 100,
				},
				path_display = {
					smart = {},
					-- shorten = { len = 1, exclude = { 1, -1 } }
				},
				mappings = {
					i = {
						["<Esc>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					find_command = {
						"fd",
						".",
                        "--type",
                        "file",
						"--hidden",
						"--ignore",
						"--strip-cwd-prefix",
					},
				},
				keymaps = { theme = "dropdown" },
				commands = { theme = "dropdown" },
				oldfiles = { theme = "dropdown" },
				live_grep = { theme = "dropdown" },
				buffers = {
					theme = "dropdown",
					ignore_current_buffer = true,
					sort_mru = true,
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("smart_history")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "rgrep (Telescope)" })
		vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "buffers (Telescope)" })
	end,
}

