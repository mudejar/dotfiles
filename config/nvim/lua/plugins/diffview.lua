return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewRefresh", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Open diffview window" },
      { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close diffview window" },
    },
    opts = function()
      return require "configs.diffview"
    end,
    config = function(_, opts)
      require("diffview").setup(opts)
    end,
  },
}
