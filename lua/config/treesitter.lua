local options = {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "git_config",
    "git_rebase",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "regex",
    "scss",
    "sql",
    "toml",
    "typescript",
    "vim",
    "vue",
    "tsx",
    "yaml",
  },
  highlight = {
    highlight_git = true,
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
}

require("nvim-treesitter.configs").setup(options)
