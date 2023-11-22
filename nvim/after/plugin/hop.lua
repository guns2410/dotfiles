-- place this in one of your configuration file(s)
require('hop').setup {
    case_insensitive = true,
    current_line_only = false,
    hint_position = require('hop.hint').HintPosition.MIDDLE,
}

local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('n', '<leader><leader>l', function()
  hop.hint_lines_skip_whitespace({ direction = { directions.AFTER_CURSOR } })
end, {remap=true})

vim.keymap.set("n", "<leader><leader>a", function()
  hop.hint_anywhere()
end, {remap=true})

vim.keymap.set("n","<leader><leader>c", function()
  hop.hint_char2({ direction = directions.AFTER_CURSOR })
end, {remap=true})

vim.keymap.set("n", "<leader><leader>C", function()
  hop.hint_char2({ direction = directions.BEFORE_CURSOR })
end, {remap=true})

vim.keymap.set("n","<leader><leader>w", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, {remap=true})

vim.keymap.set("n", "<leader><leader>W", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, {remap=true})

vim.keymap.set("n","<leader><leader>f", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR })
end, {remap=true})

vim.keymap.set("n", "<leader><leader>F", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR })
end, {remap=true})
