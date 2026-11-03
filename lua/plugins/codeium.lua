return{
  "monkoose/neocodeium",
  ft = PROGRAMMING_FT,
  --event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    vim.keymap.set("i", "<S-Tab>", neocodeium.accept)
  end,
}
