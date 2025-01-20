return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
    },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        local keymap = vim.keymap -- for conciseness

        --Keybinds

        vim.api.nvim_create_autocmd("lspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                --buffer local mappings
                --check : ':help vim.lsp.*' for doc
                local opts = { buffer = ev.buf, silent = true }

                --keymap
                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", otps) --show definitions

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) --go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>vca", function() vim.lsp.buf.code_action() end, opts) 

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) --diagnostic for files

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) --in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

                keymap.set("i", "<C-h>", function() vim.lsp.buffer.signature_help() end, opts)
                
            end,
        })

                local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
                for type, icon in pairs(signs) do
                    local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
                end

    end,
}
