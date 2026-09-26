return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",

        opts = {
            indent = {
                char = "│",
            },

            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
            },
        },
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",

        dependencies = {
            "MunifTanjim/nui.nvim",
        },

        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
            },

            messages = {
                enabled = false,
            },

            popupmenu = {
                enabled = false,
            },

            notify = {
                enabled = false,
            },

            lsp = {
                progress = {
                    enabled = false,
                },
            },
        },
    },
}
