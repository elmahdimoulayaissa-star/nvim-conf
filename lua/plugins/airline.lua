return {
  "vim-airline/vim-airline",
  dependencies = { "vim-airline/vim-airline-themes" },
  init = function()
    vim.g.airline_powerline_fonts = 1
    vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
            if vim.g.loaded_airline then
                vim.cmd("AirlineRefresh")
            end
        end,
    })
  end,
}

