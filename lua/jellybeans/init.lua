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

-- Normalize a color value: add '#' prefix to 6-digit hex colors if missing
local function normalize_color(value)
  if type(value) ~= "string" then
    return value
  end
  -- Leave special keywords as-is
  if value == "NONE" or value == "none" then
    return value
  end
  -- If it's a 6-digit hex without '#', add it
  if value:match("^%x%x%x%x%x%x$") then
    return "#" .. value
  end
  return value
end

-- Normalize all color fields in a highlight group definition
local function normalize_hl(opts)
  if type(opts) ~= "table" then
    return opts
  end
  local result = {}
  for key, value in pairs(opts) do
    if key == "fg" or key == "bg" or key == "sp" then
      result[key] = normalize_color(value)
    else
      result[key] = value
    end
  end
  return result
end

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
    -- Normalize colors before applying to prevent E5113 errors
    local normalized = normalize_hl(opts)
    vim.api.nvim_set_hl(0, group, normalized)
  end
end

return M
