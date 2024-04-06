---------------------- Keybindings --------------------
-- [ NORMAL MODE ] 

vim.g.mapleader = " "
vim.keymap.set("n", "<S-c>", "noop")

-- [ INSERT MODE ] 

vim.keymap.set("i", "<C-h>", "Left")
vim.keymap.set("i", "<C-j>", "Down")
vim.keymap.set("i", "<C-k>", "Up")
vim.keymap.set("i", "<C-k>", "Right")

-- [ VISUAL MODE ] 

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

