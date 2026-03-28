return {
  'echasnovski/mini.files',
  version = '*',
  config = function()
    local mini_files = require('mini.files')
    mini_files.setup({
      content = {
        ---@param file { fs_type: "directory" | "file", name: string, path: string }
        filter = function (file)
          if (file.fs_type == "directory" and file.name == ".git") then
            return false
          end
          return true
        end,
      },
      options = {
        permanent_delete = false,
      },
      windows = {
        max_number = 2,
        preview = true,
        width_preview = 100,
      },
    })

    vim.keymap.set("n", "<leader>e", function()
      mini_files.open(vim.api.nvim_buf_get_name(0))
    end)
  end
}
