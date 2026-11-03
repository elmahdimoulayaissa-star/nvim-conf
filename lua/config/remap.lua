vim.g.mapleader = " "

--file-explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--Lazy
vim.keymap.set("n","<leader>l", vim.cmd.Lazy)

--File-search(leaser,enter) 
vim.keymap.set("n", "<leader><CR>", function()
  require('telescope.builtin').find_files()
end, {})

--File-search(leaser,enter)
vim.keymap.set("n", "<C-p>", function()
  require('telescope.builtin').git_files()
end, {})


vim.keymap.set("n", "<leader>ps", function()
  require('telescope.builtin').live_grep()
  end)


--Undo
vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

--lsp
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })
end)


--Quality-of-life
    --to-move-selected-text
    vim.keymap.set("v","<C-Down>",":m '>+1<CR>gv=gv")
    vim.keymap.set("v","<C-Up>",":m '<-2<CR>gv=gv")
    --to-keep-seach-in-the-middle-of-the-screen
vim.keymap.set("n","n","nzzzv")
vim.keymap.set("n","N","Nzzzv")

vim.keymap.set("x","<leader>p","\"_dP")

vim.keymap.set("n","<leader>f","<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>t", ":split | terminal<CR>i")

vim.keymap.set({"n","i","v"}, "<C-s>", "<cmd>w<CR>")

vim.keymap.set("n", "<leader>q", "<cmd>wqa<CR>")


vim.keymap.set("n", "<leader>r", "<cmd>AutoSession search<CR>", { desc = "Find session" })

vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:q<CR>]])
vim.keymap.set("v","#" , ":s/^/#/<CR>:noh<CR>" )
vim.keymap.set("v","<leader>/" , ":s|^|/|<CR>:noh<CR>" )
vim.keymap.set("n","<Esc>","<cmd>nohlsearch<CR>")
--lsp
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
vim.keymap.set('n', ')d', vim.diagnostic.goto_prev , { desc = 'Prev diagnostic' })
vim.keymap.set('n', '(d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
vim.keymap.set('n', '<leader>xd', vim.diagnostic.setloclist, { desc = 'Diagnostics to loclist' })
vim.keymap.set({'n', 'v'}, 'rn', vim.lsp.buf.rename, { desc = 'rename' })

vim.keymap.set({'n','v','i'}, '<C-w>', "<cmd>bd<CR>", { nowait = true })

vim.keymap.set('n', '<F5>', function()
  local ft = vim.bo.filetype
  if  ft == 'cpp' then
    require('dap').continue()
  else
      vim.cmd('RunCode')
  end
end, { desc = 'Run/Debug current file' })

--Compiler 
vim.keymap.set('n',"<F6>","<cmd>CompilerOpen<cr>",{noremap = true, silent = true })
vim.keymap.set('n', '<S-F6>', "<cmd>CompilerStop<cr>" .. "<cmd>CompilerRedo<cr>", { noremap = true, silent = true })
vim.keymap.set('n',"<S-F7>","<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

vim.keymap.set('n','<leader>pt',"<cmd>Themery<CR>")

--deleat doesn't interfer with clipboard 
vim.keymap.set({ "n", "v" }, "d", '""d')
vim.keymap.set({ "n", "v" }, "D", '""D')
vim.keymap.set({ "n", "v" }, "c", '""c')
vim.keymap.set({ "n", "v" }, "C", '""C')
vim.keymap.set({ "n", "v" }, "x", '""x')
vim.keymap.set({ "n", "v" }, "X", '""X')
--vim.keymap.set({ "n", "v" }, "p", '""p')
--vim.keymap.set({ "n", "v" }, "P", '""P')

--toggle codeium
vim.keymap.set({"n","v"}, "<leader>ci",function ()
    vim.cmd("NeoCodeium toggle")
    vim.notify("NeoCodeium toggled!")
end,{desc = "Toggle NeoCodeium"} )

vim.keymap.set("n","<leader>si","<cmd>SpringInitializr<cr>")
vim.keymap.set("n", "<leader>sg", "<CMD>SpringGenerateProject<CR>")

