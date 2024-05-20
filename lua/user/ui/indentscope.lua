local M = {
    "echasnovski/mini.indentscope",
    version = false,
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
        symbol = "│",
        options = { try_as_border = true },
    }
}

function M.init()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = {
            "help",
            "neo-tree",
            "lazy",
            "mason",
            "notify",
        },
        callback = function()
            vim.b.miniindentscope_disable = true
        end,
    })
end

return M