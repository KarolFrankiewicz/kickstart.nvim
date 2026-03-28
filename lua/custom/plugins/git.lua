return {
  -- Diffview: full diff panel + file history + merge tool
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewFileHistory',
      'DiffviewToggleFiles',
    },
    keys = {
      {
        '<leader>gd',
        function()
          if next(require('diffview.lib').views) == nil then
            vim.cmd 'DiffviewOpen'
          else
            vim.cmd 'DiffviewClose'
          end
        end,
        desc = 'Toggle Diffview',
      },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'File History (current)' },
      { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'File History (repo)' },
    },
    opts = {
      enhanced_diff_hl = true, -- better highlights inside changed lines
      view = {
        default = { layout = 'diff2_horizontal' },
        merge_tool = { layout = 'diff3_horizontal', disable_diagnostics = true },
      },
    },
  },

  -- Neogit: Magit-style git UI with diffview integration
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim', -- enables the diff popup inside Neogit
      'nvim-telescope/telescope.nvim', -- optional, for pickers
    },
    cmd = 'Neogit',
    keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Open Neogit' },
      { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'Neogit Commit' },
      { '<leader>gp', '<cmd>Neogit push<cr>', desc = 'Neogit Push' },
      { '<leader>gl', '<cmd>Neogit log<cr>', desc = 'Neogit Log' },
    },
    opts = {
      graph_style = 'unicode', -- nicer branch graph (use "ascii" if font issues)
      kind = 'tab', -- open in a new tab (or "split", "floating")
      disable_insert_on_commit = 'auto',
      integrations = {
        diffview = true, -- wire up diffview for the diff popup
        telescope = true,
      },
      commit_editor = {
        kind = 'tab',
        show_staged_diff = true,
        staged_diff_split_kind = 'split',
        spell_check = true,
      },
      sections = {
        untracked = { folded = false },
        unstaged = { folded = false },
        staged = { folded = false },
        stashes = { folded = true },
        recent = { folded = true },
      },
    },
  },
}
