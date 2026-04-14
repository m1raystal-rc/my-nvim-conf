return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
        lua = { "stylua" },
        javascript = { "prettier" },
        python = { "black" },
      },
      formatters = {
        rustfmt = {
          prepend_args = { "--config", "tab_spaces=2,hard_tabs=true" },
        },
        stylua = {
          prepend_args = { "--indent-type", "Tabs", "--indent-width", "2" },
        },
        prettier = {
          prepend_args = { "--use-tabs", "--tab-width", "2" },
        },
      },
    },
  },
}
