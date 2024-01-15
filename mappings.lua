-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
-- i = Insert mode
-- N = Normal mode
-- T = Terminal mode
-- V = Select Mode
return {
  i = {
    ["<C-h>"] = { "<left>", desc = "move left in insert mode" },
    ["<C-j>"] = { "<Down>", desc = "move down in insert mode" },
    ["<C-k>"] = { "<Up>", desc = "move up in insert mode" },
    ["<C-l>"] = { "<Right>", desc = "move right in insert mode" },

    -- ["<C-h>"] = {"<cmd>SmartCursorMoveLeft<cr>", desc = "move left in insert mode"},
    -- ["<C-j>"] = {"<cmd>SmartCursorMoveDown<cr>", desc = "move down in insert mode"},
    -- ["<C-k>"] = {"<cmd>SmartCursorMoveUp<cr>", desc = "move up in insert mode"},
    -- ["<C-l>"] = {"<cmd>SmartCursorMoveRight<cr>", desc = "move right in insert mode"},
    -- ["<C-n>"] = {"<cmd> echo 'Hello it works?'<cr>", desc = "quick test"},
    -- ["<C-h>"] = {require('smart-splits').move_cursor_left()},
  },
  -- first key is the mode
  n = {
    ["<tab>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next Buffer",
    },

    ["<S-tab>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous Buffer",
    },

    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"\
    [";"] = { ":", desc = "enter cmdline" },

    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {},
}
