-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "Victor Mono:h28" -- text below applies for VimScript
-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.0
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#0f1117" .. alpha()

vim.g.neovide_input_macos_alt_is_meta = false

local function set_ime(args)
    if args.event:match("Enter$") then
        vim.g.neovide_input_ime = true
    else
        vim.g.neovide_input_ime = false
    end
end
local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    group = ime_input,
    pattern = "*",
    callback = set_ime
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    group = ime_input,
    pattern = "[/\\?]",
    callback = set_ime
})
end

