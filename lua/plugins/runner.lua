-- ~/.config/nvim/lua/plugins/runner.lua
return {
  {
    "CRAG666/code_runner.nvim",
--    keys = {
--      { "<F5>", "<cmd>RunCode<cr>", desc = "Run Code" },
--    },
    opts = {
      mode = "term",
      filetype = {
        python = "python3 -u",
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
      },
    },
  },
}
