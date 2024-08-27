return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  requires = { {"nvim-lua/plenary.nvim"} },
  keys = {
    {
      "<leader>a",
      function()
        local harpoon = require("harpoon")
        harpoon:list():add()
      end,
      { desc = "Add file to harpoon list" }
    },
    {
      "<C-e>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      { desc = "Toggle the harpoon list of files"}
    },
    {
      "<C-u>",
      function()
        require("harpoon"):list():select(1)
      end,
      { desc = "Select file in 1 position" }
    },
    {
      "<C-i>",
      function()
        require("harpoon"):list():select(2)
      end,
      { desc = "Select file in 2 position" }
    },
    {
      "<C-o>",
      function()
        require("harpoon"):list():select(3)
      end,
      { desc = "Select file in 3 position" }
    },
    {
      "<C-p>",
      function()
        require("harpoon"):list():select(4)
      end,
      { desc = "Select file in 4 position" }
    },
    {
      "<C-1-p>",
      function()
        require("harpoon"):list():prev()
      end,
      { desc = "Go to previous file in Harpoon list" }
    },
    {
      "<C-1-n>",
      function()
        require("harpoon"):list():next()
      end,
      { desc = "Go to next file in Harpoon list" }
    }
  },
  config = function()
    require("harpoon").setup()
  end
}
