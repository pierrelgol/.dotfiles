----------------[[ OPTIONS ]]----------------
local opt = vim.opt

opt.backup = false
opt.colorcolumn = "80"
opt.expandtab = false
opt.guicursor = ""
opt.hlsearch = false
opt.incsearch = true
opt.isfname:append("@-@")
opt.nu = true
opt.relativenumber = false
opt.scrolloff = 5
opt.shiftwidth = 4
opt.signcolumn = "yes"
opt.smartindent = true
opt.softtabstop = 4
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.updatetime = 50
opt.wrap = false
