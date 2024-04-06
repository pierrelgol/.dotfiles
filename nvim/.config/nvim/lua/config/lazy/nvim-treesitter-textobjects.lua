return {
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "BufRead",
        config = function()
            require("nvim-treesitter.configs").setup {
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["iw"] = "@word.inner",
                        ["aw"] = "@word.outer",
                        ["ii"] = "@conditional.inner",
                        ["ai"] = "@conditional.outer",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>("] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>)"] = "@parameter.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
            },
            }
        end,
    }
}
