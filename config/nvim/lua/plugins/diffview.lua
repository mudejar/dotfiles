return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewRefresh", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    opts = function()
      return require "configs.diffview"
    end,
    config = function(_, opts)
      require("diffview").setup(opts)
    end,
  },
}
