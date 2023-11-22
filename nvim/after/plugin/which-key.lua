-- document existing key chains
require('which-key').register {
    ['<leader>hc'] = { name = '[C]ode', _ = 'which_key_ignore' },
    ['<leader>hd'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    ['<leader>hg'] = { name = '[G]it', _ = 'which_key_ignore' },
    ['<leader>hh'] = { name = 'More git', _ = 'which_key_ignore' },
    ['<leader>hr'] = { name = '[R]ename', _ = 'which_key_ignore' },
}
