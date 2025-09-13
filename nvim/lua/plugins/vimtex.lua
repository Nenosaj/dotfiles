return {
  {
    "lervag/vimtex",
    name = "vimtex",
    ft = { "tex", "TEX" },
    config = function()
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        continuous = true,
        executable = "latexmk",
        options = { "-pdf", "-interaction=nonstopmode", "-synctex=1" },
      }

      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_zathura_options = "-x 'nvim --remote +%{line} %{input}'"

      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_fold_enabled = false 

      vim.api.nvim_set_keymap("n", "<leader>lc", "<cmd>VimtexCompile<CR>", { noremap = true, silent = true })

      vim.api.nvim_set_keymap("n", "<leader>ls", "<cmd>VimtexStop<CR>", { noremap = true, silent = true })

      vim.keymap.set("n", "<leader>lv", function()
        vim.cmd("VimtexView")
      end, { desc = "Open PDF at current line" })
    end,
  },
}
