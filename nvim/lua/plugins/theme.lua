return {
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
}
