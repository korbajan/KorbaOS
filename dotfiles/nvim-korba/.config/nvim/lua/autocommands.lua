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

-- auto close brackets
-- this
autocmd('FileType', { pattern = 'man', command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- Go is always tab-indented (gofmt); show tabs as 4 columns instead of letting sleuth guess
vim.g.sleuth_go_heuristics = 0
autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

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
      vim.opt_local.spell = true
      vim.opt_local.spelllang = 'en'
    end,
  }
)

local function set_float_highlights()
  vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'LspInfoBorder', { link = 'Normal' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
  -- LSP hover (Shift+K) is drawn by noice; give it nord1 so it stands out from the editor
  vim.api.nvim_set_hl(0, 'NoicePopup', { bg = '#3B4252' })

  vim.cmd 'highlight Winbar guibg=none'

  -- vim.cmd("highlight Comment guifg=#475558")
  -- vim.cmd("highlight Comment guifg=green")
end

autocmd('ColorScheme', { callback = set_float_highlights })
-- the colorscheme is already applied by the time this file loads, so apply once now too
set_float_highlights()
-- vim: ts=2 sts=2 sw=2 et
