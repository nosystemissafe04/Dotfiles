return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = { contrast = "soft" }, -- optional
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
