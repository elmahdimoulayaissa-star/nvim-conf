return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    window = {
      position = "left",
      width = 30,
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hide_dotfiles = false,
      filtered_items={
          visible = true,
          hide_dotfiles = false,
          hide_gitignored =false,
      }
    },
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
    { "<leader>o", "<cmd>Neotree focus<cr>",  desc = "Focus file explorer"  },
  },
}
