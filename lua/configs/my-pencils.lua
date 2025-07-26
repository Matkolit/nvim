function ColorMyPencils()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local options = {
  disable_background = true,
  styles = {
    italic = true,
  },
  ColorMyPencils(),
}
require("rose-pine").setup { options }
