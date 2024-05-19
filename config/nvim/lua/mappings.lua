require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- More keybinds taken from https://neovim.io/doc/user/vimindex.html
map("n", "<C-q>", "<C-W>q", { desc = "Quit current window" })
map("n", "<C-r>", "<C-W>r", { desc = "Rotate windows downwards N times" })
map("n", "<C-s>", "<C-W>s", { desc = "Split the current window into two parts, new Window N lines high" })
map("n", "<C-v>", "<C-W>v", { desc = "Split the current window vertically, new window N columns wide"})

-- Keybinds to make common tasks easier to call
map("n", "<C-g>", "1<C-G>", { desc = "Show the full filepath of the file currently opened" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
