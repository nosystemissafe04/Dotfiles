return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "jedi_language_server", "html", "clangd" },
        handlers = {
          -- default handler for all servers
          function(server)
            vim.lsp.enable(server)
          end,
        },
      })

      -- Optional per-server tweaks (must be defined before enable)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Keymaps: set them on LspAttach so they are buffer-local
      local aug = vim.api.nvim_create_augroup("LspKeymaps", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = aug,
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", ";j", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          -- Built-in completion (optional): enable autotrigger
          local client = vim.lsp.get_clients({ id = ev.data.client_id })[1]
          if client then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
          end
        end,
      })
    end,
  },
}
