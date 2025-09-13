local M = {}
function M.current()
  local file = vim.fn.expand("%:p")
  if file:match("lua/plugins/") then
    local name = vim.fn.fnamemodify(file, ":t:r")
    vim.cmd("Lazy reload " .. name)
    vim.notify("Reloaded plugin: " .. name)
    return
  end

  if file:match("lua/lsp/") then
    local mod = file:match("lua/(.*)%.lua$")
    mod = mod:gsub("/", ".")
    package.loaded[mod] = nil
    require(mod)
    vim.notify("Reloaded module: " .. mod)
    return
  end

  if file:match("nvim%-options.lua") then
    package.loaded["nvim-options"] = nil
    require("nvim-options")
    vim.notify("Reloaded nvim-options")
    return
  end

  local mod = file:match("lua/utils/(.*)%.lua$")
  if mod then
    mod = "utils." .. mod:gsub("/", ".")
    package.loaded[mod] = nil
    require(mod)
    vim.notify("Reloaded module: " .. mod)
    return
  end
end

return M
