return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local logo = [[
              ██████████████████████████            
            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██          
            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██        
          ██▒▒▒▒░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░██        
      ██████▒▒░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░██      
    ██░░░░░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████  
    ██░░░░░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██░░░░██
    ██░░░░░░▒▒░░░░░░░░░██░░░░░░░░██░░░░░░░░██░░░░██
      ████░░▒▒░░░░░░░░░░██░░░░░░░░██░░░░░░░░██████  
          ██▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██      
  ████      ██▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░██        
██    ██      ██▒▒░░░░░░░░░░░░░░░░░░░░░░██          
██  ██      ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██        
██          ██▒▒▒▒▒▒▒▒░░░░░░░░░░░░▒▒▒▒▒▒▒▒██        
  ████    ██▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒██      
      ██████▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒██      
          ██▒▒▒▒██▒▒░░░░░░░░░░░░░░░░▒▒██▒▒▒▒██      
            ██████▒▒▒▒░░░░░░░░░░░░▒▒▒▒██████        
                ██▒▒▒▒▒▒████████▒▒▒▒▒▒██            
                ██░░░░██        ██░░░░██            
                ██████            ██████
    ]]

    dashboard.section.header.val = vim.split(logo, "\n", { trimempty = true })
    dashboard.section.header.opts = { position = "center", hl = "DashboardHeader" }

    dashboard.config.layout = {
      { type = "padding", val = 1 }, -- Reduced padding at the top
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
    }

    alpha.setup(dashboard.config)
  end,
}
