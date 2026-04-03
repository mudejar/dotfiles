return {
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "stevearc/dressing.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    build = function()
      require("gitlab.server").build(true)
    end,
    cond = function()
      return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
    end,
    config = function()
      require("gitlab").setup()
    end,
    keys = {
      { "<leader>g", nil, desc = "GitLab" },
      { "<leader>gc", function() require("gitlab").choose_merge_request() end, desc = "Choose MR" },
      { "<leader>gS", function() require("gitlab").review() end, desc = "Start review" },
      { "<leader>gs", function() require("gitlab").summary() end, desc = "MR summary" },
      { "<leader>gd", function() require("gitlab").toggle_discussions() end, desc = "Toggle discussions" },
      { "<leader>gn", function() require("gitlab").create_note() end, desc = "Create note" },
      { "<leader>gA", function() require("gitlab").approve() end, desc = "Approve MR" },
      { "<leader>gR", function() require("gitlab").revoke() end, desc = "Revoke approval" },
      { "<leader>gM", function() require("gitlab").merge() end, desc = "Merge MR" },
      { "<leader>gp", function() require("gitlab").pipeline() end, desc = "Pipeline status" },
      { "<leader>go", function() require("gitlab").open_in_browser() end, desc = "Open in browser" },
      { "<leader>gu", function() require("gitlab").copy_mr_url() end, desc = "Copy MR URL" },
      { "<leader>gC", function() require("gitlab").create_mr() end, desc = "Create MR" },
      { "<leader>gP", function() require("gitlab").publish_all_drafts() end, desc = "Publish all drafts" },
    },
  },
}
