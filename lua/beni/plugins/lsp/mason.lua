return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
    },
    config = function()
        -- import mason and mason_lspconfig
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- NOTE: Moved from lspconfig.lua
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")             -- import cmp-nvim-lsp plugin
        local capabilities = cmp_nvim_lsp.default_capabilities() -- used to enable autocompletion (assign to every lsp server config)

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- servers for mason to install
            ensure_installed = {
                "lua_ls",
                -- c/c++
                "clangd",
                -- python
                "pyright",
            },
            -- auto install configured servers (with lspconfig)
            automatic_installation = true,
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "stylua",   -- lua formatter
                "isort",    -- python formatter
                "pylint",
                "clangd",
                "black",
            },
        })

        -- NOTE: Moved from lspconfig.lua

        mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["clangd"] = function()
                lspconfig.clangd.setup({
                    capabilities = capabilities,
                    filetypes = {
                        "c",
                        "cpp",
                        "objc",
                        "objcpp",
                    },
                })
            end,
            ["pyright"] = function()
                lspconfig.pyright.setup({
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                -- configure lua server (with special settings)
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            -- make the language server recognize "vim" global
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                            workspace = {
                                -- make language server aware of run time files
                                library = {
                                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                    [vim.fn.stdpath("config") .. "/lua"] = true,
                                },
                            },
                        },
                    },
                })
            end,
        })
    end,
}
