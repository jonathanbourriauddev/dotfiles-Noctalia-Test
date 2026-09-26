return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,

        config = function()
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            vim.lsp.enable({
                "lua_ls",
                "bashls",
                "pyright",
                "jsonls",
                "yamlls",
                "ts_ls",
                "html",
                "cssls",
                "emmet_language_server",
            })
        end,
    },
}

