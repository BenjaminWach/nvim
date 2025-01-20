return {
    "thePrimeagen/harpoon",
    enabled = true,
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        --local conf = require("telescope.config").values

        harpoon:setup({
            global_settings = {
                save_on_toggle = true,
                save_on_change = true,
            },
        })

    --Harpoon Nav. interface
    vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
    end, { desc = "Harpoon add file" })
    vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    --harpoon marked files
    vim.keymap.set("n", "<C-y>", function()
        harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<C-i>", function()
        harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<C-n>", function()
        harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<C-s>", function()
        harpoon:list():select(4)
    end)

    --Toggle previous and next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function()
        harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-N>", function()
        harpoon:list():next()
    end)
    
    end,
}
