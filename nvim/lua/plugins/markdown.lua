return {

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("render-markdown").setup({
        completions = { lsp = { enabled = true } },
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.keymap.set("n", "<leader>n", "<cmd>MarkdownPreview<cr>", {})
    end,
    ft = { "markdown" },
  },
}
