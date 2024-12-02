return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'arcticicestudio/nord-vim',
    -- 'shaunsingh/nord.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- vim.g.nord_contrast = true
      -- vim.g.nord_borders = false
      -- vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      -- vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false

      vim.g.nord_bold = 0
      vim.g.nord_italic = 0
      vim.g.nord_italic_comments = 1

      vim.cmd.colorscheme 'nord'
      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
      -- vim.cmd.hi 'FloatBorder guibg=#2E3440 guifg=#2E3440'
      -- vim.cmd.hi 'NormalFloat guibg=#2E3440'
      vim.cmd.hi 'FloatBorder guibg=None guifg=#68809a'
      vim.cmd.hi 'NormalFloat guibg=None'
    end,
  },
  -- {
  --   'AlexvZyl/nordic.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('nordic').setup {
  --       on_palette = function(palette)
  --         -- palette.black1 = palette.gray0
  --         palette.black1 = '#242933'
  --       end,
  --     }
  --   end,
  --   init = function()
  --     vim.cmd.colorscheme 'nordic'
  --   end,
  -- },
}
-- vim: ts=2 sts=2 sw=2 et
