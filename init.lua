-- AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key

--Neovide Config
    if vim.g.neovide == true then
        vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})    --Fullscreen Hotkey
        vim.g.neovide_scroll_animation_length = 0.001
        vim.g.neovide_cursor_animation_length = 0.01
        vim.g.neovide_hide_mouse_when_typing  = true
        vim.g.neovide_cursor_trail_size = 0.9
    end
local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "darkplus",

  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
      tabstop = 4,
      shiftwidth = 0,
      expandtab = true,
      guifont = { "JetBrainsMono NF", ":h15" },
      termguicolors = true
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " ???????????????  ????????????????????? ???????????????????????? ??????????????????   ??????????????????",
    "??????   ?????? ??????         ??????    ??????   ?????? ??????    ??????",
    "????????????????????? ?????????????????????    ??????    ??????????????????  ??????    ??????",
    "??????   ??????      ??????    ??????    ??????   ?????? ??????    ??????",
    "??????   ?????? ?????????????????????    ??????    ??????   ??????  ??????????????????",
    " ",
    "    ????????????   ??????????????????   ??????????????????????????????   ?????????",
    "    ???????????????  ??????????????????   ????????????????????????????????? ????????????",
    "    ?????????????????? ??????????????????   ????????????????????????????????????????????????",
    "    ?????????????????????????????????????????? ???????????????????????????????????????????????????",
    "    ????????? ?????????????????? ????????????????????? ?????????????????? ????????? ??????",
  },

  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#181818",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      format_on_save = true, -- enable or disable auto formatting on save
      disabled = { -- disable formatting capabilities for the listed clients
        -- "sumneko_lua",
      },
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
	["<leader>bb"]	= { "<cmd>tabnew<cr>",                      desc = "New tab" },
	["<leader>bc"]	= { "<cmd>BufferLinePickClose<cr>",         desc = "Pick to close" },
	["<leader>bj"]	= { "<cmd>BufferLinePick<cr>",              desc = "Pick to jump" },
	["<leader>bt"]	= { "<cmd>BufferLineSortByTabs<cr>",        desc = "Sort by tabs" },
	["<a-j>"]	    = { "yyp",                                  desc = "Copy Line down"},
	["<a-k>"]	    = { "yyP",                                  desc = "Copy Line up"},
	["<c-s-j>"]	    = { "ddp",                                  desc = "Move Line down"},
	["<c-s-k>"]	    = { "ddkP",                                 desc = "Move Line up"},
	["<c-s-h>"]	    = { "xhP",                                  desc = "Move Char left"},
	["<c-s-l>"]	    = { "xp",                                   desc = "Move Char right"},
	["??"]           = { "$i",                                   desc = "Insert before last char"},
	["<s-space>"]   = { "a<space><esc>",                        desc = "Append Space"},
	["<tab>"]       = { "a<tab><esc>",                          desc = "Append Tab"},
	["<cr>"]        = { "o<esc>",                               desc = "Append New Line"},
	["??"]           = { "A;<esc>",                              desc = "Append Semicolon"},
	["<a-h>"]       = { "<c-o>",                                desc = "Jump Back"},
	["<a-l>"]       = { "<c-i>",                                desc = "Jump Forward"},
	["<s-u>"]       = { "v~<esc>",                              desc = "Switch Case"},
	["<A-7>"]   = { function() require("Comment.api").toggle.linewise.current() end, desc = "Comment"},
	["<leader>vr"]  = { "<cmd>source ~/.config/nvim/lua/user/init.lua<cr>",               desc = "Reload init.lua"},
	["<leader>ve"]  = { "<cmd>split ~/.config/nvim/lua/user/init.lua<cr>211gg",               desc = "Edit init.lua"},
      -- quick save
      -- ["<c-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
    i = {
	["<a-j>"]	        = { "<esc>yypi",                              desc = "Copy Line down"},
	["<a-k>"]	        = { "<esc>yyPi",                              desc = "Copy Line up"},
	["<c-s-j>"]	        = { "<esc>:m+<cr>==i",                        desc = "Move Line down"},
	["<c-s-k>"]	        = { "<esc>:m-2<cr>==i",                       desc = "Move Line up"},
	["??"]               = { "<esc>A;",                                desc = "Append Semicolon"},
	["<A-7>"]   = {"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",  desc = "Comment"},
	["<s-cr>"]          = { "<esc>o",                                 desc = "Insert New Line"},
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
    v = {
	["<a-j>"]	    = { "y`>p",                                  desc = "Copy Selection down"},
	["<a-k>"]	    = { "yP",                                  desc = "Copy Selection up"},
    }
  },

  -- Configure plugins
  plugins = {
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- Add plugins, the packer syntax without the "use"
      -- { "andweeb/presence.nvim" },
      { "lunarvim/colorschemes" },
      -- { "kylechui/nvim-surround" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },

      -- We also support a key value style plugin definition similar to NvChad:
      -- ["ray-x/lsp_signature.nvim"] = {
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup function call
      -- local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  config.sources = {
    -- Set a formatter
    -- null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.formatting.prettier,
  }
  return config -- return final config table
end,
treesitter = { -- overrides `require("treesitter").setup(...)`
  -- ensure_installed = { "lua" },
},
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      -- ensure_installed = { "sumneko_lua" },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      -- ensure_installed = { "prettier", "stylua" },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
          ["v"] = { name = "Vim" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
