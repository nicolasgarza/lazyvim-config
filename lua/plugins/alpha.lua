return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local logo = [[
          ▀████▀▄▄              ▄█
            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█
    ▄▄       █          ▀▀▀▀▄  ▄▀
   ▄▀ ▀▄      ▀▄              ▀▄▀
  ▄▀    █     █▀   ▄█▀▄      ▄█
  ▀▄     ▀▄  █     ▀██▀     ██▄█
   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █
    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀
   █   █  █      ▄▄           ▄▀
]]
    dashboard.section.header.val = vim.split(logo, "\n", { trimempty = true })
    dashboard.section.header.opts = { position = "center", hl = "DashboardHeader" }

    function centerText(text, width)
      local totalPadding = width - #text
      local leftPadding = math.floor(totalPadding / 2)
      local rightPadding = totalPadding - leftPadding
      return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
    end

    local time = os.date("%I:%M %p")
    local date = os.date("%a %d %b")
    dashboard.section.footer.val = {
      centerText(" ", 10),
      centerText(date .. " | " .. time, 50),
      centerText(" ", 10),
    }
    dashboard.config.layout = {
      { type = "padding", val = 8 },
      dashboard.section.header,
      dashboard.section.footer,
      dashboard.section.buttons,
    }

    alpha.setup(dashboard.config)
  end,
}
