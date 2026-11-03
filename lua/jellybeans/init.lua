local M = {}

M.config = {
  transparent = false,
  italic_comments = true,
  styles = {
    sidebars = "dark",
    floats = "dark",
  },
  overrides = {},
}

-- Check if a string is a valid 6-digit hex color
local function is_hex_color(str)
  if type(str) ~= "string" then
    return false
  end
  if #str ~= 6 then
    return false
  end
  for i = 1, 6 do
    local c = str:sub(i, i)
    if not c:match("[0-9a-fA-F]") then
      return false
    end
  end
  return true
end

-- Normalize a color value: add '#' prefix to 6-digit hex colors if missing
local function normalize_color(value)
  if type(value) ~= "string" then
    return value
  end
  if value == "NONE" or value == "none" then
    return value
  end
  if value:sub(1, 1) == "#" then
    return value
  end
  if is_hex_color(value) then
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

  -- Apply user overrides explicitly after getting base groups
  if M.config.overrides and next(M.config.overrides) then
    for group, opts in pairs(M.config.overrides) do
      -- Merge override with existing group definition
      local base = groups[group] or {}
      groups[group] = vim.tbl_deep_extend("force", base, opts)
    end
  end

  -- Apply all highlight groups
  for group, opts in pairs(groups) do
    local normalized = normalize_hl(opts)
    vim.api.nvim_set_hl(0, group, normalized)
  end
end

return M
