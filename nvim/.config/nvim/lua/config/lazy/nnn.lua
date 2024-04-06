return {
  {
    "luukvbaal/nnn.nvim",
    config = function()
        require("nnn").setup()
        vim.keymap.set('n', '<leader>nn', "<cmd>NnnPicker<CR>", {desc = "File explorer"})
    end
  },
}
