local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  ["null-ls"] = {
    condition = function()
      return prettier.config_exists({
        -- if `false`, skips checking `package.json` for `"prettier"` key
        check_package_json = true,
      })
    end,
    runtime_condition = function(params)
      -- return false to skip running prettier
      return true
    end,
    timeout = 5000,
  },
  cli_options = {
    arrow_parens = "avoid",
    semi = false,
    trailing_comma = "none",
    single_quote = true,
    jsx_single_quote = true,
    html_whitespace_sensitivity = "ignore",
    jsx_bracket_same_line = true,
    tab_width = 2,
    print_width = 180
  },
})
