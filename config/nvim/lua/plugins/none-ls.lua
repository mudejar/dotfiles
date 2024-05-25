return {
  {
    "nvimtools/none-ls.nvim",
    ft = { "go", "python" },
    opts = function()
      return require "configs.null-ls"
    end,
  },
}
