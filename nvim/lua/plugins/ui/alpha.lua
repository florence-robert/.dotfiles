return {
  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
▀███▀▀▀███         
  ██    ▀█         
  ██   █      ▄██  
  ██▀▀██     ████  
  ██   █   ▄█▀ ██  
  ██     ▄█▀   ██  
▄████▄   ██████████
              ██   
              ██   
      ]]
      -- dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.header.val = logo
      return dashboard
    end,
  },
}
