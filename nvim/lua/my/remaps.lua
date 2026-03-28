vim.g.mapleader = " "
-- Remove (Q)uit mapping
vim.keymap.set("n", "Q", "<nop>")
-- Remove command history mapping
vim.keymap.set("n", "q:", "<nop>")
-- Open file explorer
-- "pv" = "project view"
-- Disabled in favor of mini.files
-- vim.keymap.set("n", "<leader>pv", ":Ex %:p:h<CR>")
-- Easier mode reset
vim.keymap.set("i", "jk", "<Esc>")
-- Yank to clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
-- Quicker file write
vim.keymap.set("n", "<leader>w", ":w<CR>")
-- Quicker split navigation
-- Source: https://www.reddit.com/r/vim/comments/pro4i7/comment/hdkwxu5
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
-- Move line up/down
-- Source: https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua#L5-L6
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Quick remove search highlight
vim.keymap.set("n", "<Esc><Esc>", ":noh<CR>")
