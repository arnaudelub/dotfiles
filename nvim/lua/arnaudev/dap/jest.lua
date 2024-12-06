--[[ require("jester").setup({
  cmd = "npm run test",
  dap = {
    console = "externalTerminal"
  }
})--]]

require('neotest').setup({
    adapters = {
        require('neotest-jest')({
            jestCommand = "npm run test",
            jestConfigFile = "jest.config.ts",
            env = { CI = true},
            cwd = function(path)
                return vim.fn.getcwd()
            end,
        })
    }
})
