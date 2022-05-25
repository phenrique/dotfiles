--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- ├─ keymappings                         {
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Esc
lvim.keys.insert_mode["kj"] = "<esc>"
lvim.keys.insert_mode["jk"] = "<esc>"
lvim.keys.insert_mode["kk"] = "<esc>"
lvim.keys.insert_mode["jj"] = "<esc>"

-- Visual
lvim.keys.normal_mode["mv"] = "<C-v>"
lvim.keys.visual_mode["u"] = "<esc>"

-- Save, exit, etc
lvim.keys.normal_mode["<leader>x"] = ":x   <cr>"

-- command line
lvim.keys.normal_mode["mm"] = ":"
lvim.keys.visual_mode["mm"] = ":"

-- search
lvim.keys.normal_mode["mf"] = "/"
-- no search
lvim.keys.normal_mode["m1"] = ":nohlsearch<cr><c-l>"

-- Tagbar
lvim.keys.visual_mode["mt"] = ":Tabularize /"


local function arduino_status()
  local ft = vim.api.nvim_buf_get_option(0, "ft")
  if ft ~= "arduino" then
    return ""
  end
  local port = vim.fn["arduino#GetPort"]()
  local line = string.format("[%s]", vim.g.arduino_board)
  if vim.g.arduino_programmer ~= "" then
    line = line .. string.format(" [%s]", vim.g.arduino_programmer)
  end
  if port ~= 0 then
    line = line .. string.format(" (%s:%s)", port, vim.g.arduino_serial_baud)
  end
  return line
end

local MY_FQBN = "arduino:avr:nano"

local opts = {
  cmd = {
    "/usr/bin/arduino-language-server",
    "-clangd", "/home/paulo/.local/share/nvim/lsp_servers/clangd/clangd/bin/clangd",
    "-cli", "/usr/bin/arduino-cli",
    --"-cli-daemon-addr", "localhost:50051",
    --"-cli-daemon-instance", "1",
    "-cli-config", "/home/paulo/.arduino15/arduino-cli.yaml",
    "-fqbn",
    MY_FQBN
    --string.format("%s", vim.g.arduino_board)
  }
}
require("lvim.lsp.manager").setup("arduino_language_server", opts)
--require("lspconfig")["arduino_language_server"].setup(opts)

--  local config = lualine.get_config()

lvim.builtin.lualine.sections.lualine_y = { arduino_status }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["a"] = {
  name = "+Arduino",
  a = { " <cmd>ArduinoAttach           <CR> ", "ArduinoAttach          " },
  m = { " <cmd>ArduinoVerify           <CR> ", "ArduinoVerify          " },
  u = { " <cmd>ArduinoUpload           <CR> ", "ArduinoUpload          " },
  d = { " <cmd>ArduinoUploadAndSerial  <CR> ", "ArduinoUploadAndSerial " },
  b = { " <cmd>ArduinoChooseBoard      <CR> ", "ArduinoChooseBoard     " },
  p = { " <cmd>ArduinoChooseProgrammer <CR> ", "ArduinoChooseProgrammer" },
  i = { " <cmd>ArduinoInfo             <CR> ", "ArduinoInfo            " },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  { "godlygeek/tabular" },
  { "rhysd/clever-f.vim" },
  { "stevearc/vim-arduino" },
  { "stevearc/dressing.nvim" },
  --   {
  --     "folke/trouble.nvim",
  --     cmd = "TroubleToggle",
  --   },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
