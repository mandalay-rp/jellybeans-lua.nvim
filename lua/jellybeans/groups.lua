local M = {}

function M.get(colors, config)
  local italic_comment = config.italic_comments and true or nil

  local groups = {
    -- Base
    Normal = { fg = colors.fg, bg = config.transparent and colors.none or colors.bg },
    CursorLine = { bg = colors.cursor_line },
    CursorColumn = { bg = colors.cursor_line },
    ColorColumn = { bg = colors.color_column_bg },
    LineNr = { fg = colors.line_nr, bg = config.transparent and colors.none or colors.bg },
    CursorLineNr = { fg = colors.cursor_line_nr, bold = true },
    Comment = { fg = colors.comment, italic = italic_comment },
    Todo = { fg = colors.todo_fg, bold = true },
    NonText = { fg = colors.non_text, bg = config.transparent and colors.none or colors.bg },
    SpecialKey = { fg = colors.special_key_fg, bg = colors.special_key_bg },
    MatchParen = { fg = colors.match_paren_fg, bg = colors.match_paren_bg, bold = true },

    -- Syntax
    Constant = { fg = colors.constant },
    String = { fg = colors.string },
    StringDelimiter = { fg = colors.string_delimiter },
    Identifier = { fg = colors.identifier },
    Statement = { fg = colors.statement },
    PreProc = { fg = colors.preproc },
    Type = { fg = colors.type },
    Special = { fg = colors.special },
    Function = { fg = colors.function_color },
    Delimiter = { fg = colors.delimiter },
    Structure = { fg = colors.structure },
    Operator = { link = "Structure" },
    Conceal = { link = "Operator" },
    Directory = { fg = colors.directory },
    Title = { fg = colors.title, bold = true },
    Question = { fg = colors.question },
    ErrorMsg = { fg = colors.fg, bg = colors.error_bg },
    Error = { link = "ErrorMsg" },
    MoreMsg = { link = "Special" },

    -- Search and selection
    Search = { fg = colors.search_fg, bg = colors.search_bg, underline = true },
    Visual = { bg = colors.visual_bg },
    Cursor = { fg = colors.bg, bg = colors.cursor },
    WildMenu = { fg = colors.wild_menu_fg, bg = colors.wild_menu_bg },

    -- UI elements
    StatusLine = { fg = colors.status_line_fg, bg = colors.status_line_bg, italic = true },
    StatusLineNC = { fg = colors.status_line_nc_fg, bg = colors.status_line_nc_bg, italic = true },
    VertSplit = { fg = colors.vert_split, bg = colors.status_line_nc_bg },
    Pmenu = { fg = colors.pmenu_fg, bg = colors.pmenu_bg },
    PmenuSel = { fg = colors.pmenu_sel_fg, bg = colors.pmenu_sel_bg },
    PmenuSbar = { bg = colors.pmenu_bg },
    PmenuThumb = { bg = colors.pmenu_sel_bg },
    TabLine = { fg = colors.tab_line_fg, bg = colors.tab_line_bg, italic = true },
    TabLineFill = { bg = colors.status_line_nc_bg },
    TabLineSel = { fg = colors.tab_line_sel_fg, bg = colors.tab_line_sel_bg, bold = true, italic = true },
    Folded = { fg = colors.folded_fg, bg = colors.folded_bg, italic = true },
    FoldColumn = { fg = colors.fold_column_fg, bg = colors.fold_column_bg },
    SignColumn = { fg = colors.sign_column_fg, bg = config.transparent and colors.none or colors.sign_column_bg },

    -- Diff
    DiffAdd = { fg = colors.diff_add_fg, bg = colors.diff_add_bg },
    DiffDelete = { fg = colors.diff_delete_fg, bg = colors.diff_delete_bg },
    DiffChange = { bg = colors.diff_change_bg },
    DiffText = { fg = colors.diff_text_fg, bg = colors.diff_text_bg, reverse = true },

    -- Spell checking
    SpellBad = { bg = colors.spell_bad_bg, undercurl = true, sp = colors.error_bg },
    SpellCap = { bg = colors.spell_cap_bg, undercurl = true, sp = colors.spell_cap_bg },
    SpellRare = { bg = colors.spell_rare_bg, undercurl = true, sp = colors.spell_rare_bg },
    SpellLocal = { bg = colors.spell_local_bg, undercurl = true, sp = colors.spell_local_bg },

    -- Treesitter (modern syntax highlighting in Neovim)
    ["@comment"] = { link = "Comment" },
    ["@constant"] = { link = "Constant" },
    ["@string"] = { link = "String" },
    ["@string.delimiter"] = { link = "StringDelimiter" },
    ["@variable"] = { link = "Identifier" },
    ["@variable.parameter"] = { fg = colors.identifier },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { fg = colors.preproc },
    ["@keyword"] = { link = "Statement" },
    ["@keyword.return"] = { fg = colors.statement },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = colors.type },
    ["@property"] = { fg = colors.identifier },
    ["@field"] = { fg = colors.identifier },
    ["@constructor"] = { fg = colors.preproc },
    ["@tag"] = { link = "Type" },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@tag.attribute"] = { link = "Identifier" },
    ["@operator"] = { link = "Operator" },
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.bracket"] = { link = "Delimiter" },

    -- LSP diagnostics
    DiagnosticError = { fg = colors.error_bg },
    DiagnosticWarn = { fg = colors.directory },
    DiagnosticInfo = { fg = colors.preproc },
    DiagnosticHint = { fg = colors.special },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.error_bg },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.directory },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.preproc },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.special },

    -- Git / Diff compatibility
    diffAdded = { fg = colors.string },
    diffRemoved = { fg = colors.constant },
    DiffAdded = { fg = colors.string },
    DiffRemoved = { fg = colors.constant },
  }

  -- Apply user overrides
  if config.overrides then
    for group, opts in pairs(config.overrides) do
      groups[group] = vim.tbl_deep_extend("force", groups[group] or {}, opts)
    end
  end

  return groups
end

return M
