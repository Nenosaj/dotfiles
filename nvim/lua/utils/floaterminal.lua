local M = {}

local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({ buf = state.floating.buf })
    local buf = state.floating.buf

    if vim.bo[buf].buftype ~= "terminal" then
      local file_dir = vim.fn.expand("%:p:h")
      if file_dir == "" then
        file_dir = vim.loop.cwd()
      end

      vim.api.nvim_buf_set_var(buf, "term_cwd", file_dir)
      vim.cmd("lcd " .. file_dir)
      vim.cmd("terminal")
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end

  vim.cmd("startinsert")
end

local kill_terminal = function()
  local buf = state.floating.buf
  local win = state.floating.win

  if vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end

  if vim.api.nvim_buf_is_valid(buf) then
    vim.api.nvim_buf_delete(buf, { force = true })
  end

  state.floating.buf = -1
  state.floating.win = -1
end
vim.api.nvim_create_user_command("KillFloaterm", kill_terminal, {})
vim.keymap.set({ "n", "t" }, "<leader>tk", kill_terminal)
vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<leader>tt", toggle_terminal)

return M
