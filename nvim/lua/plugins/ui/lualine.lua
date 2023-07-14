local colorscheme = require("utils.colorscheme")
-- local hydra = require("hydra.statusline")

return {
  {
    "nvim-lualine/lualine.nvim",
    --[[ dependencies = {
      "anuvyklack/hydra.nvim",
    }, ]]
    opts = function()
      ---@type lazyvimconfig
      local config = require("lazyvim.config")
      local icons = config.icons
      local hide_in_width = function()
        return vim.fn.winwidth(0) > 100
      end
      return {
        --- @type lazyvimconfig
        options = {
          theme = colorscheme.get("lualine"),
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        },
        sections = {
          lualine_a = {
            "mode",
            --[[ {
              hydra.get_name,
              color = colorscheme.get("hydra_lualine"),
              cond = hydra.is_active,
            }, ]]
          },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.error,
                warn = icons.diagnostics.warn,
                info = icons.diagnostics.info,
                hint = icons.diagnostics.hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1 },
          },
          lualine_x = {
            {
              "searchcount",
              icon = "",
              timeout = 500,
              maxcount = 999,
            },
            {
              "diff",
              colored = true, -- displays a colored diff status if set to true
              diff_color = {
                -- same color values as the general color option can be used here.
                added = "diffadd", -- changes the diff's added color
                modified = "diffchange", -- changes the diff's modified color
                removed = "diffdelete", -- changes the diff's removed color you
              },
              symbols = { added = icons.git.added, modified = icons.git.modified, removed = icons.git.removed }, -- changes the symbols used by the diff.
              source = nil, -- a
              -- it must return a table as such:
              --   { added = add_count, modified = modified_count, removed = removed_count }
              -- or nil on failure. count <= 0 won't be displayed.
              cond = hide_in_width,
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            {
              "fileformat",
              cond = hide_in_width,
              symbols = {
                unix = "", -- e712
                dos = "", -- e70f
                mac = "", -- e711
              },
            },
            { icon = "", "hostname", cond = hide_in_width },
          },
        },
        extensions = {
          "neo-tree",
          "lazy",
          "man",
          "quickfix",
          "symbols-outline",
          "toggleterm",
          -- "trouble",
        },
      }
    end,
  },
}
