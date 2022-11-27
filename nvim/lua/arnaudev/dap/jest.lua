require("jester").setup({
  cmd = "npm run test",
  dap = {
    console = "externalTerminal"
  }
})
