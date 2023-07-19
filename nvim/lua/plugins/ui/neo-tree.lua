return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "right" })
        end,
        desc = "Toggle file explorer (right)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "float" })
        end,
        desc = "Toggle file explorer (float)",
      },
    },
    opts = {
      window = {
        position = "right",
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        bind_to_cwd = true,
        filtered_items = {
          visible = false, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = true,
          hide_gitignored = true,
        },
      },
    },
  },
}
