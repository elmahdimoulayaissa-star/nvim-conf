
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        -- Sets default lsp-zero keybindings
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls' },
        handlers = {
          lsp_zero.default_setup,
          
          -- Intercept lua_ls initialization
          lua_ls = function()
            require('lspconfig').lua_ls.setup({
              on_init = function(client)
                -- Get active root path
                local path = client.workspace_folders[1].name
                -- If a local config exists in the folder, let LuaLS read it directly
                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                  return
                end

                -- Fallback defaults for general Lua editing if no .luarc.json is found
                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                  runtime = { version = 'LuaJIT' },
                  diagnostics = { globals = { 'vim' } },
                  workspace = {
                    library = { vim.env.VIMRUNTIME }
                  },
                })
              end,
              settings = {
                Lua = {}
              }
            })
          end,
        }
      })
    end
  }
}
