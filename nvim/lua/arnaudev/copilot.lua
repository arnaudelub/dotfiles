
require('copilotChat').setup({
  opts = {
      debug = true,
      show_help = "yes",
      prompts= {
        Explain = "Explain how it works.",
        Review = "Review the following code and provide concise suggestions.",
        Tests = "Briefly explain how the selected code works, then generate unit tests.",
        Refactor = "Refactor the code to improve clarity and readability.",
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
})
-- create a game that loops over the suggestions and prints them
-- the input is a number from 
-- create a game 
