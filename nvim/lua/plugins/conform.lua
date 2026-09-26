return {
    {
        "stevearc/conform.nvim",

        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    lua = { "stylua" },

                    sh = { "shfmt" },
                    bash = { "shfmt" },

                    python = { "black" },

                    javascript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescript = { "prettier" },
                    typescriptreact = { "prettier" },

                    html = { "prettier" },

                    css = { "prettier" },
                    scss = { "prettier" },
                    less = { "prettier" },

                    json = { "prettier" },
                    jsonc = { "prettier" },

                    yaml = { "prettier" },
                },

                format_on_save = {
                    timeout_ms = 1000,
                    lsp_format = "fallback",
                },
            })

            vim.keymap.set("n", "<leader>cf", function()
                conform.format({
                    async = true,
                    lsp_format = "fallback",
                })
            end, {
                desc = "Format file",
            })
        end,
    },
}

