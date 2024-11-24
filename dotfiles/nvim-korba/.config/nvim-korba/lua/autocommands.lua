-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

local api = vim.api

local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup

-- don't auto comment new line
autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('nvim-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
autocmd('BufReadPost', {
  callback = function()
    local mark = api.nvim_buf_get_mark(0, '"')
    local lcount = api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- auto close brackets
-- this
autocmd('FileType', { pattern = 'man', command = [[nnoremap <buffer><silent> q :quit<CR>]] })

autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local line = vim.fn.line '\'"'
    if line > 1 and line <= vim.fn.line '$' and vim.bo.filetype ~= 'commit' and vim.fn.index({ 'xxd', 'gitrebase' }, vim.bo.filetype) == -1 then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- Enable spell checking for certain file types
autocmd(
  { 'BufRead', 'BufNewFile' },
  -- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
  {
    pattern = { '*.txt', '*.md', '*.tex' },
    callback = function()
      vim.opt.spell = true
      vim.opt.spelllang = 'en,pl'
    end,
  }
)

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'LspInfoBorder', { link = 'Normal' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })

    vim.cmd 'highlight Winbar guibg=none'

    -- vim.cmd("highlight Comment guifg=#475558")
    -- vim.cmd("highlight Comment guifg=green")
  end,
})
-- vim: ts=2 sts=2 sw=2 et
