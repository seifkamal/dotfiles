-- Liquorice

local c = {
  white = "#EEE5E9",
  black = "#121314",
  purple = "#D1C8E1",
  grey = "#515457",
  red = "#E75A7C",
  magenta = "#B799C8",
  blue = "#7B8CDE",
  green = "#72BDA3",
  yellow = "#E6AA68",
  neutral = "#191919",
}

_G.colors = c

vim.cmd("hi Normal guibg=" .. c.black)
vim.cmd("hi NormalFloat guibg=" .. c.black)
vim.cmd("hi Visual guibg=" .. c.yellow .. " guifg=" .. c.black)
vim.cmd("hi WinSeparator guifg=" .. c.neutral)
vim.cmd("hi CursorLine guibg=" .. c.neutral)
vim.cmd("hi Search guibg=" .. c.purple .. " guifg=" .. c.black)
vim.cmd("hi CurSearch guibg=" .. c.magenta .. " guifg=" .. c.black)
vim.cmd("hi MatchParen guibg=" .. c.purple .. " guifg=" .. c.magenta)
vim.cmd("hi Identifier guifg=" .. c.white)
vim.cmd("hi Variable guifg=" .. c.white)
vim.cmd("hi Comment guifg=" .. c.grey)
vim.cmd("hi Statement guifg=" .. c.magenta)
vim.cmd("hi Function guifg=" .. c.purple)
vim.cmd("hi Special guifg=" .. c.blue)
vim.cmd("hi Tag guifg=" .. c.red)
vim.cmd("hi String guifg=" .. c.green)
vim.cmd("hi Type guifg=" .. c.yellow)
vim.cmd("hi Number guifg=" .. c.yellow)
vim.cmd("hi Constant guifg=" .. c.yellow)
vim.cmd("hi DiagnosticVirtualTextHint guifg=" .. c.grey)
vim.cmd("hi DiagnosticUnderlineHint gui=undercurl guisp=" .. c.grey)
vim.cmd("hi DiagnosticSignHint guifg=" .. c.grey)
vim.cmd("hi DiagnosticFloatingHint guifg=" .. c.white)
vim.cmd("hi DiagnosticVirtualTextError guifg=" .. c.red)
vim.cmd("hi DiagnosticUnderlineError guisp=" .. c.red)
vim.cmd("hi DiagnosticSignError guifg=" .. c.red)
vim.cmd("hi DiagnosticFloatingError guifg=" .. c.red)
vim.cmd("hi StatusLine guibg=" .. c.black .. " guifg=" .. c.grey)
vim.cmd("hi ModeMsg gui=bold guifg=" .. c.white)
vim.cmd("hi MoreMsg guifg=" .. c.blue)
vim.cmd("hi WarningMsg guifg=" .. c.yellow)
vim.cmd("hi Question guifg=" .. c.blue)
vim.cmd("hi QuickFixLine guifg=" .. c.blue)
vim.cmd("hi Directory guifg=" .. c.white)

vim.cmd("hi! link StatusLineNC StatusLine")
vim.cmd("hi link @type.builtin Type")
-- html,jsx,tsx
vim.cmd("hi link @tag.builtin Tag")
vim.cmd("hi link @tag.tsx Type")
vim.cmd("hi link @tag.attribute Variable")
vim.cmd("hi link @tag.delimiter Operator")
-- Custom query for subcomponent highlighting
-- See `~/.config/nvim/after/queries/jsx/highlights.scm`
vim.cmd("hi link @tag.parent Type")
vim.cmd("hi link @tag.child Function")
-- css
vim.cmd("hi link @operator.css Special")
vim.cmd("hi link @attribute.css Keyword")
vim.cmd("hi link @variable.css Type")
-- xml,svg
vim.cmd("hi link xmlTag @tag.delimiter")
vim.cmd("hi link xmlTagName @tag.builtin")
vim.cmd("hi link xmlAttrib @tag.attribute")
-- markdown
vim.cmd("hi link @markup.heading Type")
vim.cmd("hi link @markup.link Function")
