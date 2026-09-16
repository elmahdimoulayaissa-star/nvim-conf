return {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes ={
            {
                name = "gruvbox-transparent",
                colorscheme = "gruvbox",
                before = "require('gruvbox').setup({transparent_mode = true,})",
                after = "vim.g.airline_theme = 'wombat'; vim.cmd('AirlineRefresh')",
            },
            {
                name = "catppuccin-transparent",
                colorscheme = "catppuccin",
                before = "require('catppuccin').setup({transparent_background = true,})",
                after = "vim.g.airline_theme = 'solarized'; vim.cmd('AirlineRefresh')",
            },
            {
                name = "high contrast",
                colorscheme = "github_dark_high_contrast",
                after = "vim.g.airline_theme = 'solarized'; vim.cmd('AirlineRefresh')",
            },
            {
                name = "github dark",
                colorscheme = "github_dark",
                after = "vim.g.airline_theme = 'solarized'; vim.cmd('AirlineRefresh')",
            },
            {
                name = "gruvbox-solid",
                colorscheme = "gruvbox",
                before = "require('gruvbox').setup({transparent_mode = false,})",
                after = "vim.g.airline_theme = 'wombat'; vim.cmd('AirlineRefresh')",
            },
            {
                name = "catppuccin-solid",
                colorscheme = "catppuccin",
                before = "require('catppuccin').setup({transparent_background = false,})",
                after = "vim.g.airline_theme = 'solarized'; vim.cmd('AirlineRefresh')",
            },
            {
                name = "catppuccin-latte",
                colorscheme = "catppuccin-latte",
                before = "require('catppuccin').setup({transparent_background = false,})",
            },
            {
                name = "catppuccin-macchiato",
                colorscheme = "catppuccin-macchiato",
                before = "require('catppuccin').setup({transparent_background = false,})",
                after = "vim.g.airline_theme = 'solarized'; vim.cmd('AirlineRefresh')",
            },
        },
        livePreview = true,
      })
    end
}
