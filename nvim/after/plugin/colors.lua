require('rose-pine').setup({
    disable_background = true
})

require("tokyonight").setup({
    transparent = true,
    style = "night",
    terminal_colors = true,
    lualine_bold = true,
})

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


require("kanagawa").setup({
    compile = false,
    undercurl = true,
    commentStyle  = { italic = true },
    transparent = true,
    dimInactive = false,
    terminalColors = true,
    theme = "wave",

})

ColorMyPencils("kanagawa-wave")

