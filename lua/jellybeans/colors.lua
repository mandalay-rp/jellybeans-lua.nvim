local M = {}

-- Base colors (with required '#' prefix for Neovim)
M.bg = "#151515"
M.fg = "#e8e8d3"
M.none = "NONE"

-- UI elements
M.cursor_line = "#1c1c1c"
M.cursor = "#b0d0f0"
M.match_paren_bg = "#556779"
M.match_paren_fg = "#ffffff"

-- Status line and tabs
M.status_line_fg = "#000000"
M.status_line_bg = "#dddddd"
M.status_line_nc_fg = "#ffffff"
M.status_line_nc_bg = "#403c41"
M.vert_split = "#777777"
M.tab_line_fg = "#000000"
M.tab_line_bg = "#b0b8c0"
M.tab_line_sel_fg = "#000000"
M.tab_line_sel_bg = "#f0f0f0"

-- Menus and search
M.pmenu_fg = "#ffffff"
M.pmenu_bg = "#606060"
M.pmenu_sel_fg = "#101010"
M.pmenu_sel_bg = "#eeeeee"
M.wild_menu_fg = "#f0a0c0"
M.wild_menu_bg = "#302028"
M.search_fg = "#f0a0c0"
M.search_bg = "#302028"
M.visual_bg = "#404040"

-- Line numbers and folding
M.line_nr = "#605958"
M.cursor_line_nr = "#ccc5c4"
M.folded_fg = "#a0a8b0"
M.folded_bg = "#384048"
M.fold_column_fg = "#535D66"
M.fold_column_bg = "#1f1f1f"
M.sign_column_fg = "#777777"
M.sign_column_bg = "#333333"
M.color_column_bg = "#000000"

-- Syntax (Rich Jellybeans colors)
M.comment = "#888888"
M.todo_fg = "#c7c7c7"
M.constant = "#cf6a4c"        -- Reddish-orange
M.string = "#99ad6a"          -- Muted green
M.string_delimiter = "#556633"
M.identifier = "#c6b6ee"      -- Light purple/lavender
M.statement = "#8197bf"       -- Soft blue
M.preproc = "#8fbfdc"         -- Light blue
M.type = "#ffb964"            -- Bright orange/yellow
M.special = "#799d6a"         -- Green
M.function_color = "#fad07a"  -- Yellow
M.delimiter = "#668799"       -- Grey-blue
M.structure = "#8fbfdc"
M.directory = "#dad085"       -- Yellowish
M.title = "#70b950"           -- Green
M.question = "#65C254"        -- Green
M.error_bg = "#902020"        -- Dark red
M.non_text = "#606060"
M.special_key_fg = "#444444"
M.special_key_bg = "#1c1c1c"

-- Diff (Git)
M.diff_add_fg = "#D2EBBE"
M.diff_add_bg = "#437019"
M.diff_delete_fg = "#40000A"
M.diff_delete_bg = "#700009"
M.diff_change_bg = "#2B5B77"
M.diff_text_fg = "#8fbfdc"
M.diff_text_bg = "#000000"

-- Spell checking
M.spell_bad_bg = "#902020"
M.spell_cap_bg = "#0000df"
M.spell_rare_bg = "#540063"
M.spell_local_bg = "#2D7067"

return M
