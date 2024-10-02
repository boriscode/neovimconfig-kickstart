return {
  'akinsho/toggleterm.nvim',
  version = '*', -- Use the latest stable version
  config = function()
    -- Setup for toggleterm
    require('toggleterm').setup {
      size = 20, -- Size of terminal window
      open_mapping = [[<c-\>]], -- Default key mapping to toggle terminal
      direction = 'float', -- Change to 'horizontal', 'vertical', 'tab', or 'float'
      float_opts = {
        border = 'curved', -- Border style for floating window
      },
    }

    -- Terminal keymaps setup
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      -- Keybindings to toggle between terminals
      vim.api.nvim_set_keymap('n', '<leader>1', ':1ToggleTerm<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>2', ':2ToggleTerm<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>3', ':3ToggleTerm<CR>', { noremap = true, silent = true })
    end

    -- Automatically set keymaps when terminal opens
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
  end,
}
