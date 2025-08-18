-- require("cyberdream").setup({
--   italic_comments = true,
--   highlights = {
--     LineNr = { fg = "#ad01a6" },
--     CursorLineNr = { fg = "#ffc000", bold = true },
--   },
-- })

function ColorMyPencils()
  vim.cmd("colorscheme tokyonight-storm")
  -- Set the background to transparent
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffc000", bold = true })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#ad01a6" })
end

ColorMyPencils()
