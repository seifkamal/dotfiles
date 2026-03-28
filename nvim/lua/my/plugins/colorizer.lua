return {
  "norcalli/nvim-colorizer.lua",
  name = "colorizer",
  lazy = true,
  config = function ()
    require("colorizer").setup()
  end
}
