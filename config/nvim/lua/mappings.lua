require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- More keybinds taken from https://neovim.io/doc/user/vimindex.html
map("n", "<C-q>", "<C-W>q", { desc = "Window Quit current window" })
map("n", "<C-r>", "<C-W>r", { desc = "Window Rotate windows downwards N times" })
map("n", "<C-s>", "<C-W>s", { desc = "Window Split the current window into two parts, new Window N lines high" })
map("n", "<C-v>", "<C-W>v", { desc = "Window Split the current window vertically, new window N columns wide"})

-- Keybinds to make common tasks easier to call
map("n", "<C-g>", "1<C-G>", { desc = "File Show the full filepath of the file currently opened" })

--- Tabufline
local tabufline = require "nvchad.tabufline"

map("n", "<Tab>", function()
  tabufline.next()
end, { desc = "Buffer go to next"})

map("n", "<S-Tab>", function()
  tabufline.prev()
end, { desc = "Buffer go to prev"})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
