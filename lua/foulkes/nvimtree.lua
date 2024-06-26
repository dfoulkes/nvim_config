vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>',       api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',           api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', '<leader>nt',  api.tree.focus,                        opts('Toggle'))
  vim.keymap.set('n', '<leader>t',   api.node.open.tab,		                  opts('Open in new tab'))
  vim.keymap.set('n', '<leader>sn',  api.node.navigate.sibling.next,	      opts('Open in new split'))
  --vim.keymap.set('n', '<leader>ot', api.tree.tab_open,                opts('Open in new tab'))
  -- return focus to nvim-tree after opening a file
  -- vim.keymap.set('n', '<leader> nt', function()
  --                                       api.nvim_command("NvimTreeFocus")
  --                                     end, opts('Toggle'))
end



require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}

-- pass to setup along with your other options
-- require("nvim-tree").setup {
--   sort = {
--     sorter = "case_sensitive",
--   },
--   view = {
--     width = 30,
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   }
-- } 
