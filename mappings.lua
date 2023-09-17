---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>q"] = { "<cmd> quit <CR>", "quit current buffer", opts = { nowait = true } },
    ["<leader>w"] = { "<cmd> w <CR>", "write current buffer to file" },
    ["<leader>wq"] = { "<cmd> wq <CR>", "write and quit current buffer to file" , opts = { nowait = true }},
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
