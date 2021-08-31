-------------------- HELPERS -------------------------------
local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local opt, wo, op = vim.opt, vim.wo, vim.o
local fmt = string.format

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end
-------------------- LSP -----------------------------------
require('lspinstall').setup() -- important

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

map('i', '<A-,>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('i', '<A-;>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('i', '<A-a>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('i', '<A-d>', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('i', '<A-f>', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('i', '<A-h>', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('i', '<A-m>', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('i', '<A-r>', '<cmd>lua vim.lsp.buf.references()<CR>')
map('i', '<A-s>', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
