----------------[[ KEYBINDINGS ]]----------------

local key = vim.keymap

----------------[[    GLOBAL   ]]----------------

vim.g.mapleader = " "

----------------[[    NORMAL   ]]----------------

key.set("n", "<leader>qq", "<CMD>wqa<CR>", { desc = "write and quit all buffers" })
key.set("n", "Tab", "<CMD>bn<CR>", { desc = "switch to the next buffer" })
key.set("n", "S-Tab", "<CMD>bp<CR>", { desc = "switch to the previous buffer" })
key.set("n", "<leader>qb", "<CMD>bdelete<CR>", { desc = "quit the current buffer" })

----------------[[    INSERT   ]]----------------

key.set("i", "<C-h>", "<Left>", { desc = "move 1 char left in insert mode" })
key.set("i", "<C-l>", "<Right>", { desc = "move 1 char right in insert mode" })
key.set("i", "<C-j>", "<Down>", { desc = "move 1 line down in insert mode" })
key.set("i", "<C-k>", "<Up>", { desc = "move 1 line up in insert mode" })
key.set("i", "<C-e>", "<End>", { desc = "move to end of line in insert mode" })
key.set("i", "<C-b>", "<Home>", { desc = "move to start of line in insert mode" })

----------------[[    VISUAL   ]]----------------

key.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected line down a line" })
key.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected line up a line" })

----------------[[    PLUGIN   ]]----------------

-- nvim-tree
key.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
key.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
key.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
key.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- telescope
key.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
key.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
key.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy find string in cwd" })
key.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Fuzzy find string under cursor in cwd" })
key.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Fuzzy find buffers" })
key.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Fuzzy find Todos" })

key.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" })
key.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
key.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
key.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
key.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
key.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show available code actions" })
key.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
key.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
key.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
key.set("n", "[d", vim.diagnostic.goto_prev, { desc = "goto prev diagnostic" })
key.set("n", "]d", vim.diagnostic.goto_prev, { desc = "goto next diagnostic" })
key.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under cursor" })
key.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP" })

-- auto-session
key.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })             -- restore last workspace session for current directory
key.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

-- nvim-dap
--[[ key.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { silent = true, noremap = true })
key.set("n", "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", { silent = true, noremap = true })
key.set("n", "<leader>dsi", "<cmd>lua require'dap'.step_into()<CR>", { silent = true, noremap = true })
key.set("n", "<leader>dso", "<cmd>lua require'dap'.step_out()<CR>", { silent = true, noremap = true })
key.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true, noremap = true })
key.set("n", "<leader>dui", ":lua require('dapui').toggle()<cr>", { silent = true, noremap = true })
key.set("n", "<leader>dcc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>",
	{ silent = true, noremap = true })
key.set("n", "<leader>dlb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>",
	{ silent = true, noremap = true })
key.set("n", "<leader>dv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>",
	{ silent = true, noremap = true })
key.set("n", "<leader>df", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>", { silent = true, noremap = true }) ]]
