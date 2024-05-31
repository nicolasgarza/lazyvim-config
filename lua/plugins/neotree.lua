return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false, -- keeps NeoTree window open when it is the last window
      window = {
        position = "right", -- Opens the NeoTree on the right side of the screen
        width = 40, -- Set the width of the NeoTree window
      },
    })
  end,
}
