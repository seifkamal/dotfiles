-- This assumes that `fzf` and `rg` are already installed:
-- `brew install fzf ripgrep`.
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require('fzf-lua')
    local actions = require('fzf-lua.actions')
    fzf.setup({
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
      files = {
        cmd = 'rg --files --hidden --follow --glob "!.git/*"',
      },
      grep = {
        cmd = 'rg --vimgrep --column --line-number',
        actions = {
          ["ctrl-g"]   = { actions.toggle_ignore },
        },
      },
    })

    -- project
    vim.keymap.set("n", "<leader>p", fzf.files, { silent = true })
    vim.keymap.set("n", "<leader>f", fzf.live_grep, { silent = true })
    vim.keymap.set("n", "<leader>b", fzf.buffers, { silent = true })
    vim.keymap.set("n", "<leader>s", fzf.lsp_live_workspace_symbols, { silent = true })
    -- LSP
    vim.keymap.set("n", "<leader>r", fzf.lsp_references, { silent = true })
    vim.keymap.set("n", "gd", fzf.lsp_definitions, { silent = true })
    -- Git
    vim.keymap.set("n", "<leader>gf", fzf.git_bcommits, { silent = true })
  end
}
