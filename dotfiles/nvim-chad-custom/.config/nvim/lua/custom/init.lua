vim.api.nvim_create_autocmd(
  {
    "BufNewFile",
    "BufRead",
  },
  {
    pattern = "*Tiltfile*",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "filetype", "tiltfile")
      -- vim.cmd [[ set syntax=python ]]
    end;
    }
)
-- vim.api.nvim_create_autocmd(
--   {
--     "BufNewFile",
--     "BufRead"
--   },
--   {
--     pattern = "Tiltfile",
--     -- command = "set syntax=python",
--     callback = function()
--       -- vim.api.nvim_buf_get_option
--       vim.cmd [[ set syntax=python ]]
--     end
--   }
-- )
