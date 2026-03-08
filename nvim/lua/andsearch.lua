vim.api.nvim_create_user_command("AndSearch", function(opts)
  local terms = opts.fargs
  local pattern = "\\v"
  for _, word in ipairs(terms) do
    pattern = pattern .. "(?=.*" .. vim.fn.escape(word, '\\') .. ")"
  end
  vim.cmd("/" .. pattern)
end, { nargs = "+" })
