themes = {
    catppuccin = 
    {
        "catppuccin/nvim",
        priority = 1000,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
    },
    kanagawa_paper =
    {
        "thesimonho/kanagawa-paper.nvim",
        lazy = false,
        priority = 1000,
        init = function()
        vim.cmd.colorscheme("kanagawa-paper-ink")
        end,
        opts = {}
    }
}

return themes["kanagawa_paper"]

