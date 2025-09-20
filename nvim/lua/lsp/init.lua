-- lua/lsp/init.lua
return {
	require("lsp.mason"),
	require("lsp.mason-lspconfig"),
	require("lsp.lspconfig"),
	require("lsp.telescope-lsp"),
  require("lsp.gruvbox"),
  require("lsp.none-ls"),
}
