-- Servers with default config (capabilities, on_init, on_attach are set
-- globally by NvChad's defaults() via vim.lsp.config("*", ...))
local servers = { "html", "cssls", "vimls", "bashls", "jsonls", "jdtls" }

vim.lsp.enable(servers)

-- Python
vim.lsp.config("pyright", { filetypes = { "python" } })
vim.lsp.config("ruff", { filetypes = { "python" } })
vim.lsp.enable { "pyright", "ruff" }

-- Golang
vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})
vim.lsp.enable "gopls"
