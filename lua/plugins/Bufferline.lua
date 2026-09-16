return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
    },
  },
  keys = {
  { "<C-Tab>",   "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer"     },
  { "<C-S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
  { "<leader>bd", "<cmd>bdelete<cr>",            desc = "Close buffer"    },
},}
