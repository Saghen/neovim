require("bufferline").setup({
  options = {
    themable = true,
    indicator = {
      -- style = "underline"
    },
    right_mouse_command = nil,
    middle_mouse_command = "bdelete! %d",
    diagnostics = "nvim-lsp",
    show_close_icon = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = function()
          return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end,
        highlight = "Directory",
        separator = false
      }
    }
  },
  highlights = {
    indicator_selected = {
      fg = "#3498DB"
    }
  }
})
