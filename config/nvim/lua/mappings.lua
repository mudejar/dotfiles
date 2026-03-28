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

-- IntelliJ-style navigation
map("n", "<C-A-Left>", "<C-o>", { desc = "Navigate Jump back in jump list" })
map("n", "<C-A-Right>", "<C-i>", { desc = "Navigate Jump forward in jump list" })

--- Tabufline
local tabufline = require "nvchad.tabufline"

map("n", "<Tab>", function()
  tabufline.next()
end, { desc = "Buffer go to next"})

map("n", "<S-Tab>", function()
  tabufline.prev()
end, { desc = "Buffer go to prev"})
-- Maven keymaps
map("n", "<leader>mc", "<cmd>Maven compile<cr>", { desc = "Maven Compile" })
map("n", "<leader>mC", "<cmd>Maven clean compile<cr>", { desc = "Maven Clean compile" })
map("n", "<leader>mp", "<cmd>Maven clean package -Ddocker.skip=true<cr>", { desc = "Maven Package (no Docker)" })
map("n", "<leader>mt", "<cmd>Maven test<cr>", { desc = "Maven Test all" })
map("n", "<leader>mi", "<cmd>Maven clean install -DskipTests -Ddocker.skip=true -DskipITs=true -T 4<cr>", { desc = "Maven Install (skip tests)" })
map("n", "<leader>ms", "<cmd>Maven spotless:apply<cr>", { desc = "Maven Spotless apply" })
map("n", "<leader>mS", "<cmd>Maven spotless:check<cr>", { desc = "Maven Spotless check" })
map("n", "<leader>md", "<cmd>Maven dependency:tree<cr>", { desc = "Maven Dependency tree" })
map("n", "<leader>mg", "<cmd>Maven clean generate-sources<cr>", { desc = "Maven Generate sources (protobuf)" })
map("n", "<leader>mm", "<cmd>Maven<cr>", { desc = "Maven Pick goal" })
map("n", "<leader>mx", "<cmd>MavenExec<cr>", { desc = "Maven Execute custom command" })

-- Maven test current file (runs test for the class matching current filename)
map("n", "<leader>mT", function()
  local filename = vim.fn.expand "%:t:r"
  vim.cmd("Maven test -Dtest=" .. filename)
end, { desc = "Maven Test current file" })

-- Maven build current module (uses -pl with the module containing current file)
map("n", "<leader>mb", function()
  local filepath = vim.fn.expand "%:p"
  local pom = vim.fs.find("pom.xml", { path = vim.fn.expand "%:p:h", upward = true, stop = vim.fn.getcwd() })[1]
  if pom then
    local module_dir = vim.fn.fnamemodify(pom, ":h")
    local root = vim.fn.getcwd()
    local relative = module_dir:sub(#root + 2)
    if relative and relative ~= "" then
      vim.cmd("Maven clean compile -am -pl " .. relative)
    else
      vim.cmd "Maven clean compile"
    end
  else
    vim.cmd "Maven clean compile"
  end
end, { desc = "Maven Build current module" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Terminal pane navigation (e.g. from Claude Code pane)
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal Move to left window" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal Move to right window" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal Move to lower window" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal Move to upper window" })
