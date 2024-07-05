local keymap = vim.keymap
local opts = { silent = true }

vim.g.mapleader = " "

-- basic
keymap.set("i", "kj", "<Esc>")
keymap.set("i", "<C-v>", "<C-r>+")
keymap.set("n", "<Esc>", ":nohl<cr>", opts)
keymap.set("n", "<leader>q", ":quit<cr>", opts)
keymap.set("n", "<leader>Q", ":qa!<cr>", opts)
keymap.set("n", "<leader>w", ":write<cr>", opts)

-- better db
keymap.set("n", "db", 'vb"_d')

-- ignore folds
keymap.set("n", "k", "gk")
keymap.set("n", "j", "gj")

-- tabs
keymap.set("n", "H", ":bnext<cr>", opts)
keymap.set("n", "L", ":bprev<cr>", opts)

-- split
keymap.set("n", "ss", ":vsplit<cr>", opts)
keymap.set("n", "sv", ":split<cr>", opts)

-- window movement
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- window resizing
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- move line up/down
keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- visual indent
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
