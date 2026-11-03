vim.g.mapleader=" "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
PROGRAMMING_FT={
  -- scripting / general
  "lua", "python", "ruby", "perl", "php", "sh", "bash", "zsh", "fish", "vim",
  "r", "julia", "powershell",
  -- web
  "javascript", "javascriptreact", "typescript", "typescriptreact",
  "html", "css", "scss", "sass", "less", "vue", "svelte", "astro",
  "svg", "xml", "graphql",
  -- systems / compiled
  "c", "cpp", "rust", "go", "zig", "java", "kotlin", "scala", "cs",
  "swift", "objc", "dart", "haskell", "ocaml", "elixir", "erlang",
  "clojure", "fsharp",
  -- data / config
  "json", "jsonc", "yaml", "toml", "sql", "dockerfile", "make", "cmake",
  "terraform", "nix", "ini", "conf",
}

vim.filetype.add({
  extension = { png = "image", jpg = "image", jpeg = "image", gif = "image", webp = "image",pdf = "pdf" },
})


if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end


vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"



vim.opt.rtp:prepend(lazypath)

require('lazy').setup("plugins")


local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<Tab>'] = cmp.mapping.confirm({select = true}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})
