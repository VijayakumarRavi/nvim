-------------------- PLUGIN SETUP --------------------------

-------------------- HELPERS -------------------------------
local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local opt, wo, op = vim.opt, vim.wo, vim.o
local fmt = string.format

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- fzf & fzf.vim
g['fzf_action'] = {['ctrl-s'] = 'split', ['ctrl-v'] = 'vsplit'}
map('n', '<leader>/', '<cmd>BLines<CR>')
map('n', '<leader>f', '<cmd>Files<CR>')
map('n', '<leader>;', '<cmd>History:<CR>')
map('n', '<leader>r', '<cmd>Rg<CR>')
map('n', 's', '<cmd>Buffers<CR>')

-- gitsigns.nvim
require('gitsigns').setup {
  signs = {
    add = {text = '+'},
    change = {text = '~'},
    delete = {text = '-'}, topdelete = {text = '-'}, changedelete = {text = '≃'},
  },
}

-- indent-blankline.nvim
--g['indent_blankline_char'] = '┊'
--vim.opt.listchars = { eol = "↴",}
--g['indent-blankline_show_end_of_line'] = true
--g['indent_blankline_buftype_exclude'] = {'terminal', 'nofile', '<empty>'}
--g['indent_blankline_filetype_exclude'] = {'fugitive', 'fzf', 'help', 'man', 'dashboard'}

-- nvim-bufbar
-- require('bufbar').setup {show_bufname = 'visible', show_tabs = true, show_flags = true}

-- nvim-bufdel
require('bufdel').setup {next = 'alternate', quit = false}
map('n', '<leader>w', '<cmd>BufDel<CR>')

-- nvim-buildme
map('n', 'bb', '<cmd>BuildMe<CR>')
map('n', '<leader>be', '<cmd>BuildMeEdit<CR>')
map('n', '<leader>bs', '<cmd>BuildMeStop<CR>')

-- nvim-hardline
require('hardline').setup {}

-- nvim-lspfuzzy
require('lspfuzzy').setup {}

-- vim-dirvish
g['dirvish_mode'] = [[:sort ,^.*[\/],]]
map('', '<leader>d', ':Shdo ')

-- vim-fugitive & git
local log = [[\%C(yellow)\%h\%Cred\%d \%Creset\%s \%Cgreen(\%ar) \%Cblue\%an\%Creset]]
map('n', '<leader>g<space>', ':Git ')
map('n', '<leader>gd', '<cmd>Gvdiffsplit<CR>')
map('n', '<leader>gg', '<cmd>Git<CR>')
map('n', '<leader>gl', fmt('<cmd>term git log --graph --all --format="%s"<CR><cmd>start<CR>', log))

-- Dashbord
-- cmd ("let g:dashboard_default_executive = 'fzf' ")
