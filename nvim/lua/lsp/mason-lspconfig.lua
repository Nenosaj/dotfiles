return {
  "mason-org/mason-lspconfig.nvim",
  name = "mason-lspconfig",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "texlab" },
    })
  end,
}
