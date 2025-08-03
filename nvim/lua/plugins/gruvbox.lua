return {
  "luisiacc/gruvbox-baby",
  branch = "main",
  priority = 1000, 
  config = function()
    vim.g.gruvbox_baby_function_style = "NONE"
    vim.g.gruvbox_baby_keyword_style = "italic"
    vim.g.gruvbox_baby_transparent_mode = false
    vim.g.gruvbox_baby_telescope_theme = false

    vim.cmd.colorscheme("gruvbox-baby")
  end,
}

