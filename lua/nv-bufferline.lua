vim.opt.termguicolors = true
require("bufferline").setup{}

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map('n', '<silent>[b', ':BufferLineCycleNext<CR>')
map('n', '<silent>b]', ':BufferLineCyclePrev<CR>')

-- These commands will move the current buffer backwards or forwards in the bufferline
map('n', '<silent><mymap>', ':BufferLineMoveNext<CR>')
map('n', '<silent><mymap>', ':BufferLineMovePrev<CR>')

-- These commands will sort buffers by directory, language, or a custom criteria
map('n', '<silent>be', ':BufferLineSortByExtension<CR>')
map('n', '<silent>bd', ':BufferLineSortByDirectory<CR>')
map('n', '<silent><mymap>', '<cmd>:lua require\'bufferline\'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>')



