local function format_hunks_range()
  local hunks = require('gitsigns').get_hunks()
  if next(hunks) == nil then
    vim.notify('done formatting git hunks', 'info', { title = 'formatting' })
    return
  end
  local hunk = nil
  while next(hunks) ~= nil and (hunk == nil or hunk.type == 'delete') do
    hunk = table.remove(hunks)
  end

  local format = require('conform').format
  if hunk ~= nil and hunk.type ~= 'delete' then
    local start = hunk.added.start
    local last = start + hunk.added.count
    -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
    local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
    local range = { start = { start, 0 }, ['end'] = { last - 1, last_hunk_line:len() } }
    format({ range = range, async = true, lsp_fallback = true }, function()
      vim.defer_fn(function()
        format_hunks_range()
      end, 1)
    end)
  end
end

return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      -- format_on_save = function(bufnr)
      --   -- Disable "format_on_save lsp_fallback" for languages that don't
      --   -- have a well standardized coding style. You can add additional
      --   -- languages here or re-enable it for the disabled ones.
      --   local disable_filetypes = { c = true, cpp = true }
      --   local lsp_format_opt
      --   if disable_filetypes[vim.bo[bufnr].filetype] then
      --     lsp_format_opt = 'never'
      --   else
      --     lsp_format_opt = 'fallback'
      --   end
      --   return {
      --     timeout_ms = 500,
      --     lsp_format = lsp_format_opt,
      --   }
      -- end,
      -- format_on_save = function(bufnr)
      --   -- Disable "format_on_save lsp_fallback" for languages that don't
      --   -- have a well standardized coding style. You can add additional
      --   -- languages here or re-enable it for the disabled ones.
      --   local disable_filetypes = { c = true, cpp = true }
      --   if disable_filetypes[vim.bo[bufnr].filetype] then
      --     return {
      --       timeout_ms = 500,
      --       lsp_format = 'never',
      --     }
      --   end
      --   -- local ignore_filetypes = { 'lua' }
      --   -- if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
      --   local ignore_filetypes = { lua = true }
      --   if ignore_filetypes[vim.bo[bufnr].filetype] then
      --     vim.notify('range formatting for ' .. vim.bo.filetype .. ' is not working properly.')
      --     require('conform').format { lsp_fallback = true, timeout_ms = 500 }
      --     return
      --   end
      --   if require('gitsigns.cache').cache[bufnr] then
      --     local cursor_position = vim.api.nvim_win_get_cursor(0)
      --     format_hunks_range()
      --     vim.api.nvim_win_set_cursor(0, cursor_position)
      --     return
      --   end
      --   return {
      --     timeout_ms = 500,
      --     lsp_format = 'fallback',
      --   }
      -- end,
      -- formatters_by_ft = {
      --   lua = { 'stylua' },
      --   -- Conform can also run multiple formatters sequentially
      --   python = { 'isort', 'black' },
      --   --
      --   -- You can use 'stop_after_first' to run the first available formatter from the list
      --   -- javascript = { "prettierd", "prettier", stop_after_first = true },
      -- },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
