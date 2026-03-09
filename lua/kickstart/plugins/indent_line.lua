---@module 'lazy'
---@type LazySpec
return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    ---@module 'ibl'
    ---@type ibl.config
    cond = not vim.g.vscode,
    opts = {
      indent = {
        char = '▏', -- thin vertical bar
      },
      scope = {
        enabled = true, -- highlight current scope (function/block)
        show_start = true,
      },
    },
  },
}
