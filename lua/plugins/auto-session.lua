return {
  "rmagatti/auto-session",
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("auto-session").setup({
      auto_save = true,
      auto_restore = true,
    })
  end,
}
