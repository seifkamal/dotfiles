return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },
}
