-- bootstrap lazy.nvim, LazyVim and your plugins
vim.cmd([[
  hi DashboardHeader guifg=#d2b48c guibg=#282828
  hi DashboardText guifg=#d2b48c guibg=#282828
]])
require("config.lazy")
