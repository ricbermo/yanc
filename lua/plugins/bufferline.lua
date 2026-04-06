return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "NvimTree",
          text = "",
          separator = true,
        },
      },
      show_close_icon = false,
      show_buffer_close_icons = false,
      separator_style = "thin",
    },
  },
}
