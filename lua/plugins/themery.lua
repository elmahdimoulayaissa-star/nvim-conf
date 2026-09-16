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
            },
            {
                name = "catppuccin-transparent",
                colorscheme = "catppuccin",
                before = "require('catppuccin').setup({transparent_background = true,})",
            },
            {
                name = "gruvbox-solid",
                colorscheme = "gruvbox",
                before = "require('gruvbox').setup({transparent_mode = false,})",
            },
            {
                name = "catppuccin-solid",
                colorscheme = "catppuccin",
                before = "require('catppuccin').setup({transparent_background = false,})",
            },
        },
        livePreview = true,
      })
    end
}
