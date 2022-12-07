local prettier = require("prettier")

prettier.setup({
    bin = 'prettier',
    filetypes = {"css", "graphql", "html", "javascript", "javascriptreact", "json", "less", "markdown", "scss",
                 "typescript", "typescriptreact", "yaml"},
    cli_options = {
        arrow_parens = "avoid",
        print_width = 110,
        semi = false,
        single_quote = true,
        tab_width = 2,
        trailing_comma = "all"
    }
})
