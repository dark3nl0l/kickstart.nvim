-- lua/plugins/harpoon.lua
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local ok, harpoon = pcall(require, 'harpoon')
    if not ok then
      return
    end

    -- Setup Harpoon
    harpoon:setup {
      menu = { width = 48 },
      settings = { save_on_toggle = true },
    }

    local map = vim.keymap.set

    -- Add current file
    map('n', '<leader>H', function()
      harpoon:list():add()
    end, { desc = 'Harpoon Add File' })

    -- Toggle Harpoon menu
    map('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon Menu' })

    -- Jump to files 1-5
    for i = 1, 5 do
      map('n', '<leader>' .. i, function()
        harpoon:list():select(i)
      end, { desc = 'Harpoon Jump to File ' .. i })
    end

    -- Optional: Cycle through files with previous/next
    map('n', '<C-S-P>', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon Prev File' })

    map('n', '<C-S-N>', function()
      harpoon:list():next()
    end, { desc = 'Harpoon Next File' })
  end,
}
