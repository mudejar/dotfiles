return {
  {
    "eatgrass/maven.nvim",
    cmd = { "Maven", "MavenExec" },
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      local executable = "mvn"
      if vim.fn.filereadable("mvnw") == 1 then
        executable = "./mvnw"
      end
      require("maven").setup {
        executable = executable,
      }
    end,
  },
}
