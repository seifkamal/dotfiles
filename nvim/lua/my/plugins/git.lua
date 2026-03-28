return {
  {
    "lewis6991/gitsigns.nvim",
    name = "gitsigns",
    init = function ()
      vim.cmd(":hi GitSignsAdd guifg=" .. _G.colors.green)
      vim.cmd(":hi GitSignsAddPreview guifg=" .. _G.colors.green)
      vim.cmd(":hi GitSignsChange guifg=" .. _G.colors.yellow)
      vim.cmd(":hi GitSignsDelete guifg=" .. _G.colors.red)
      vim.cmd(":hi GitSignsDeletePreview guifg=" .. _G.colors.red)
    end,
    opts = {
      on_attach = function(buffer)
        local gitsigns = require 'gitsigns'
        local opts = { buffer = buffer }

        vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, opts)
        vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, opts)
        vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, opts)
        vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, opts)
        vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk, opts)
        vim.keymap.set('n', ']c', function() gitsigns.nav_hunk('next') end, opts)
        vim.keymap.set('n', '[c', function() gitsigns.nav_hunk('prev') end, opts)
      end
    }
  },
  {
    "almo7aya/openingh.nvim",
    config = function()
      vim.keymap.set({ "n", "v" }, "<Leader>go", ":OpenInGHFileLines <CR>", { silent = true, noremap = true })
    end
  },
}
