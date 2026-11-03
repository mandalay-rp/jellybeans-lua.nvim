local M = {}

M.config = {
  transparent = false,        -- Enable transparent background
  italic_comments = true,     -- Italic comments (matching the original scheme)
  styles = {
    sidebars = "dark",        -- "dark" or "transparent" for sidebars
    floats = "dark",          -- "dark" or "transparent" for floating windows
  },
  overrides = {},             -- Custom highlight group overrides
}

--- Configure the color scheme
---@param opts? table
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

--- Load the color scheme
function M.load()
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.cmd("hi clear")

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "jellybeans"

  local colors = require("jellybeans.colors")
  local groups = require("jellybeans.groups").get(colors, M.config)

  for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
