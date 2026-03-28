return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function ()
    require("ibl").setup()

    vim.cmd("hi @ibl.scope.underline.1 gui=none")
    vim.cmd("hi @ibl.scope.char.1 guifg=" .. _G.colors.purple)
  end,
}
