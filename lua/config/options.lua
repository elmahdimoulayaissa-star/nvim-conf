--- Native Vim Settings 
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true


-- Force transparent background
--vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
--vim.cmd[[hi NormalNC guibg=NONE ctermbg=NONE]]
--vim.cmd[[hi LineNr guibg=NONE ctermbg=NONE]]
--vim.cmd[[hi SignColumn guibg=NONE ctermbg=NONE]]
--vim.cmd[[hi EndOfBuffer guibg=NONE ctermbg=NONE]]




vim.opt.undofile = true
vim.opt.undodir = "~/.local/state/nvim/undodir"

vim.o.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.splitbelow = true

vim.diagnostic.config({
  virtual_text = {
    prefix = ' ●', -- '■', '▎', 'icon'
    spacing = 4,
    format = function (diagnostic)
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
            return diagnostic.message
        else
            return ''
        end
    end,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})
