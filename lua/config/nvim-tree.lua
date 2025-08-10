local api = require("nvim-tree.api")

local function navigate_via_keys(bufnr)
  local opts = { buffer = bufnr }

  api.config.mappings.default_on_attach(bufnr)

  local function lefty()
    local node = api.tree.get_node_under_cursor()
    if not node then
      return
    end

    if node.nodes and node.open then
      api.node.open.edit()
    else
      api.node.navigate.parent()
    end
  end

  local function righty()
    local node = api.tree.get_node_under_cursor()
    if not node then
      return
    end

    if node.nodes and not node.open then
      api.node.open.edit()
    end
  end

  vim.keymap.set("n", "h", lefty, opts)
  vim.keymap.set("n", "<Left>", lefty, opts)
  vim.keymap.set("n", "l", righty, opts)
  vim.keymap.set("n", "<Right>", righty, opts)
end

local options = {
  on_attach = navigate_via_keys,
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  diagnostics = {
    enable = true,
  },
  view = {
    width = 55,
    preserve_window_proportions = true,
    relativenumber = true,
  },
  renderer = {
    root_folder_label = false,
    highlight_git = true,
    indent_markers = { enable = true },
    icons = {
      glyphs = {
        default = "󰈚",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
        },
        git = {
          unmerged = "",
        },
      },
    },
  },
}

require("nvim-tree").setup(options)
