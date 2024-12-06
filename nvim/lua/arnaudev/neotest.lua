require("neotest").setup({
  adapters = {
    require("neotest-jest")({
      dap = { justMyCode = true },
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})
