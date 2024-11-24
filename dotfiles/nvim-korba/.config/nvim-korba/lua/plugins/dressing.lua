return {
  -- Neovim plugin to improve the default vim.ui interfaces
  {
    'stevearc/dressing.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {},
    config = function()
      require('dressing').setup()
    end,
  },
}
