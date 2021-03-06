local colors = require('theme.colors')
local lsp = require('feline.providers.lsp')

local vi_mode_colors = {
  ["n"] = { "NORMAL", colors.grey },
  ["no"] = { "N-PENDING", colors.grey },
  ["i"] = { "INSERT", colors.green },
  ["ic"] = { "INSERT", colors.green },
  ["t"] = { "TERMINAL", colors.green },
  ["v"] = { "VISUAL", colors.purple },
  ["V"] = { "V-LINE", colors.purple },
  [""] = { "V-BLOCK", colors.purple },
  ["R"] = { "REPLACE", colors.red },
  ["Rv"] = { "V-REPLACE", colors.red },
  ["s"] = { "SELECT", colors.blue },
  ["S"] = { "S-LINE", colors.blue },
  [""] = { "S-BLOCK", colors.blue },
  ["c"] = { "COMMAND", colors.yellow },
  ["cv"] = { "COMMAND", colors.yellow },
  ["ce"] = { "COMMAND", colors.yellow },
  ["r"] = { "PROMPT", colors.yellow },
  ["rm"] = { "MORE", colors.yellow },
  ["r?"] = { "CONFIRM", colors.yellow },
  ["!"] = { "SHELL", colors.grey },
}

local icons_styles = {
  arrow = {
    left = "",
    right = "",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
  }
}

-- Initialize the components table
local components = {
  active = {},
  inactive = {},
}

-- Initialize left, mid and right
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

components.active[1][1] = {
  provider = icons_styles.arrow.main_icon,
  
  hl = {
    bg = colors.bgVariants.b800,
    fg = colors.yellow,
  },
  
  right_sep = {
    str = icons_styles.arrow.right,
    hl = {
      bg = colors.bgVariants.b700,
      fg = colors.bgVariants.b800,
    }
  }
}

components.active[1][2] = {
  provider = function ()
    local filename = vim.fn.expand "%:t"
    local extension = vim.fn.expand "%:e"
    local icon = require("nvim-web-devicons").get_icon(filename, extension)
    
    if icon == nil then
      icon = "  "
      return icon
    end
    return " " .. icon .. " " .. filename ..  " "
  end,
  
  hl = {
    bg = colors.bgVariants.b700,
    fg = colors.cyan,
  },
  
  right_sep = {
    str = icons_styles.arrow.right,
    hl = {
      bg = colors.bgVariants.b600,
      fg = colors.bgVariants.b700,
    }
  }
}

components.active[1][3] = {
  provider = function ()
    local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    return "  " .. dir_name .. " "
  end,
  
  hl = {
    bg = colors.bgVariants.b600,
    fg = colors.fg,
  },
  
  right_sep = {
    str = icons_styles.arrow.right,
    hl = {
      bg = colors.bgVariants.b800,
      fg = colors.bgVariants.b600,
    }
  }
}

components.active[1][4] = {
  provider = "git_diff_added",
  hl = {
    fg = colors.bgVariants.cyan,
    bg = colors.bgVariants.b800,
  },
  icon = "  ",
}

components.active[1][5] = {
  provider = "git_diff_changed",
  hl = {
    fg = colors.bgVariants.cyan,
    bg = colors.bgVariants.b800,
  },
  icon = "  ",
}

components.active[1][6] = {
  provider = "git_diff_removed",
  hl = {
    fg = colors.bgVariants.cyan,
    bg = colors.bgVariants.b800,
  },
  icon = "  ",
}

components.active[1][7] = {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist "Error"
  end,
  hl = { fg = colors.red },
  icon = "  ",
}

components.active[1][8] = {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist "Warning"
  end,
  hl = { fg = colors.yellow },
  icon = "  ",
}

components.active[1][9] = {
  provider = "diagnostic_hints",
  enabled = function()
    return lsp.diagnostics_exist "Hint"
  end,
  hl = { fg = colors.grey },
  icon = "  ",
}

components.active[1][10] = {
  provider = "diagnostic_info",
  enabled = function()
    return lsp.diagnostics_exist "Information"
  end,
  hl = { fg = colors.green },
  icon = "  ",
}

components.active[2][1] = {
  provider = function ()
    local Lsp = vim.lsp.util.get_progress_messages()[1]
    
    if Lsp then
      local message = Lsp.message or ""
      local percentage = Lsp.percentage or 0
      local title = Lsp.title or ""
      local spinners = {
        "",
        "",
        "",
      }
      
      local success_icon = {
        "",
        "",
        "",
      }
      
      local ms = vim.loop.hrtime() / 1000000
      local frame = math.floor(ms / 120) % #spinners
      
      if percentage >= 70 then
        return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, message, percentage)
      else
        return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, message, percentage)
      end
    end
    return ""
  end,
  hl = {
    fg = colors.grey,
    bg = colors.bg,
  },
}

local chad_mode_hl = function()
  return {
    fg = vi_mode_colors[vim.fn.mode()][2],
    bg = colors.bgVariants.b800,
  }
end

components.active[3][1] = {
  provider = " " .. icons_styles.arrow.left,
  hl = {
    fg = colors.bgVariants.b700,
    bg = colors.bgVariants.b800,
  },
}

components.active[3][2] = {
  provider = "git_branch",
  
  hl = {
    bg = colors.bgVariants.b600,
    fg = colors.orange,
  },
  icon = "  ",

  left_sep = {
    str = icons_styles.arrow.left,
    hl = {
      bg = colors.bgVariants.b700,
      fg = colors.bgVariants.b600,
    }
  }
}

components.active[3][3] = {
  provider = " " .. icons_styles.arrow.left,
  hl = {
    bg = colors.bgVariants.b600,
    fg = colors.bgVariants.b500,
  },
}

components.active[3][4] = {
  provider = icons_styles.arrow.left,
  hl = function()
    return {
      fg = vi_mode_colors[vim.fn.mode()][2],
      bg = colors.bgVariants.b500,
    }
  end,
}

components.active[3][5] = {
  provider = icons_styles.arrow.vi_mode_icon,
  hl = function()
    return {
      fg = '#f8f8f8',
      bg = vi_mode_colors[vim.fn.mode()][2],
    }
  end,
}

components.active[3][6] = {
  provider = function()
    return " " .. vi_mode_colors[vim.fn.mode()][1] .. " "
  end,
  hl = chad_mode_hl,
}

components.active[3][7] = {
  provider = icons_styles.arrow.left,
  hl = {
    fg = colors.bgVariants.b300,
    bg = colors.bgVariants.b800,
  },
}

components.active[3][8] = {
  provider = icons_styles.arrow.left,
  hl = {
    fg = colors.cyan,
    bg = colors.bgVariants.b300,
  },
}

components.active[3][9] = {
  provider = icons_styles.arrow.position_icon,
  hl = {
    fg = colors.bgVariants.b300,
    bg = colors.cyan,
  },
}

components.active[3][10] = {
  provider = function()
    local current_line = vim.fn.line "."
    local total_line = vim.fn.line "$"
    
    if current_line == 1 then
      return " Top "
    elseif current_line == vim.fn.line "$" then
      return " Bot "
    end
    local result, _ = math.modf((current_line / total_line) * 100)
    return " " .. result .. "%% "
  end,
  
  hl = {
    fg = colors.bgVariants.b300,
    bg = colors.cyan,
  },
}

components.inactive[1][1] = {
  provider = icons_styles.arrow.main_icon,
  
  hl = {
    bg = colors.bgVariants.b800,
    fg = colors.yellow,
  },
  
  right_sep = {
    str = icons_styles.arrow.right,
    hl = {
      bg = colors.bgVariants.b700,
      fg = colors.bgVariants.b800,
    }
  }
}

components.inactive[1][2] = {
  provider = icons_styles.arrow.right,
  hl = {
    bg = colors.bgVariants.b600,
    fg = colors.bgVariants.b700,
  },
}

require('feline').setup({
  colors = {
    bg = colors.bgVariants.b800,
    fg = colors.fg,
  },
  vi_mode_colors = vi_mode_colors,
  components = components,
})
