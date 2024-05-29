---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'nord',
  transparency = true,
  nvdash = {
    load_on_startup = true,
    header = {
      '██╗  ██╗ ██████╗ ██████╗ ██████╗  █████╗ ██╗   ██╗██╗███╗   ███╗',
      '██║ ██╔╝██╔═══██╗██╔══██╗██╔══██╗██╔══██╗██║   ██║██║████╗ ████║',
      '█████╔╝ ██║   ██║██████╔╝██████╔╝███████║██║   ██║██║██╔████╔██║',
      '██╔═██╗ ██║   ██║██╔══██╗██╔══██╗██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║',
      '██║  ██╗╚██████╔╝██║  ██║██████╔╝██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║',
      '╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
    },
  },
  statusline = {
    overriden_modules = function(modules)
      modules[2] = (function()
        local config = require("core.utils").load_config().ui.statusline
        local sep_style = config.separator_style

        local default_sep_icons = {
          default = { left = "", right = " " },
          round = { left = "", right = "" },
          block = { left = "█", right = "█" },
          arrow = { left = "", right = "" },
        }

        local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

        local sep_r = separators["right"]
        local icon = " 󰈚 "
        local name = vim.fn.expand("%:.")

        if name ~= "Empty " then
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")

          if devicons_present then
            local ft_icon = devicons.get_icon(name)
            icon = (ft_icon ~= nil and " " .. ft_icon) or ""
          end

          name = " " .. name .. " "
        end

        return "%#St_file_info#" .. icon .. name .. "%#St_file_sep#" .. sep_r
      end)()
    end,
  },
}
M.plugins = "custom.pluggins"
M.mappings = require "custom.mappings"

vim.opt.rnu = true -- vim.cmd("set rnu!") -- set relative line numbers

return M
