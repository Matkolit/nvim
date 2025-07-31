local options = {
  ensure_installed = {
    "bash",
    --"c",
    --"cpp",
    "css",
    "dockerfile",
    "git_config",
    "git_rebase",
    --"go",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    --"python",
    "regex",
    --"rust",
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
