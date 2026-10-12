-- nvim-treesitter `main` branch: it only installs parsers/queries. Highlighting comes from
-- Neovim itself (vim.treesitter.start) and must be enabled per filetype, done below.
-- Requires the `tree-sitter` CLI (pacman: tree-sitter-cli) and a C compiler.
local ensure_installed = {
  'bash', 'c', 'diff', 'gitignore', 'go', 'gomod', 'gosum', 'html', 'hyprlang', 'json', 'lua', 'luadoc',
  'markdown', 'markdown_inline', 'python', 'query', 'toml', 'vim', 'vimdoc', 'yaml',
}

-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
--  If you are experiencing weird indenting issues, add the language to these lists.
local regex_highlight = { ruby = true }
local no_ts_indent = { ruby = true }

local function enable(buf, lang)
  if not pcall(vim.treesitter.start, buf, lang) then
    return
  end
  if regex_highlight[lang] then
    vim.bo[buf].syntax = 'on'
  end
  if not no_ts_indent[lang] then
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false, -- main branch does not support lazy-loading
    build = ':TSUpdate',
    config = function()
      local ts = require 'nvim-treesitter'
      ts.install(ensure_installed)

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not lang then
            return
          end
          if vim.treesitter.language.add(lang) then
            enable(args.buf, lang)
          elseif vim.tbl_contains(ts.get_available(), lang) then
            -- Autoinstall languages that are not installed, then enable them
            ts.install(lang):await(function()
              vim.schedule(function()
                if vim.api.nvim_buf_is_valid(args.buf) then
                  enable(args.buf, lang)
                end
              end)
            end)
          end
        end,
      })
    end,
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects (use its `main` branch too)
  },
}
-- vim: ts=2 sts=2 sw=2 et
