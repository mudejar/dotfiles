return {
  {
    "crispgm/nvim-go",
    ft = { "go", "gomod", "gowork", "gotmpl" },
    keys = {
      { "<leader>gf", "<cmd>GoFormat<cr>", desc = "Run go format on codebase" },
      { "<leader>ga", "<cmd>GoTestAll<cr>", desc = " Go test all"},
    },
    config = function()
      require("go").setup({})
    end,
  }
}

