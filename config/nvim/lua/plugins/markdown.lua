return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
      { "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" } },
      { "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown preview" } },
      { "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop the markdown preview" } },
    },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
