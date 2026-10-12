return {
  -- delete buffer
  {
    'famiu/bufdelete.nvim',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<leader>x', ":lua require('bufdelete').bufdelete(0, false)<cr>", { noremap = true, silent = true, desc = 'Delete buffer' })
    end,
  },
}
