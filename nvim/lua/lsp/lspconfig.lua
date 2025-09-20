return {
  "neovim/nvim-lspconfig",
  name = "lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.diagnostic.config({
      signs = true,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
      virtual_text = {
        spacing = 2,
        prefix = "⛔",
        severity = { min = vim.diagnostic.severity.ERROR },
      },
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.texlab.setup({
      capabilities = capabilities,
      filetypes = { "tex", "bib", "plaintex", "TEX" },
      settings = {
        texlab = {
          bibtexFormatter = "texlab",
          chktex = {
            onEdit = true,
            onOpenAndSave = true,
          },
          diagnosticsDelay = 300,
          formatterLineLength = 80,
        },
      },
    })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
  end,
}
