return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          numbers = 'none',
          diagnostics = 'nvim_lsp',
          separator_style = 'slant', -- "slant", "padded_slant", "thin"
          show_close_icon = false,
          show_buffer_close_icons = true,
          always_show_bufferline = true,
        },
      }
    end,
  },
}
