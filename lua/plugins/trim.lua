return {
    "cappyzawa/trim.nvim",
    opts = {},
    config = function ()
        require("trim").setup({
            ft_blocklist = {""},
            trim_on_write = true,
            trim_trailing = true,
            highlight = true,
            highlight_bg = '#9a0000',
            notifications = true,
        })
    end
}
