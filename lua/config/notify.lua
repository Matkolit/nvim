local notify = require("notify")

---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, level, opts)
  if type(msg) == "string" and msg:find("spelunk") then
    return notify("Bookmarked added", vim.log.levels.INFO, { title = "Spelunk" })
  elseif type(msg) == "string" and msg:find("NvimTree") and msg:find("created") then
    return notify("File created", vim.log.levels.INFO, { title = "NvimTree" })
  elseif type(msg) == "string" and msg:find("NvimTree") and msg:find("removed") then
    return notify("File deleted", vim.log.levels.INFO, { title = "NvimTree" })
  elseif type(msg) == "string" and msg:find("NvimTree") and msg:find("->") then
    return notify("File renamed", vim.log.levels.INFO, { title = "NvimTree" })
  end
  notify(msg, level, opts)
end

return vim.notify
