-- Resources:
-- - https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/treesitter.lua
-- - https://www.josean.com/posts/nvim-treesitter-and-textobjects
-- - https://www.reddit.com/r/neovim/comments/r10llx/the_most_amazing_builtin_feature_nobody_ever/
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "vimdoc",
        "lua",
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "json",
        "html",
        "css",
        "markdown",
        "yaml",
        "python",
      },
      sync_install = false,
      auto_install = false,
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          scope_incremental = false,
          node_incremental = '<CR>',
          node_decremental = '<bs>',
        },
      },
    }

    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt.foldtext = ""
    vim.opt.foldlevel = 99
  end
}
