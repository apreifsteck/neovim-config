local actions = require('telescope.actions')
local fb_actions = require "telescope._extensions.file_browser.actions"

require('telescope').setup {
  defaults = {
    layout_config = {
      width = 0.75,
      prompt_position = "top",
      preview_cutoff = 120,
      horizontal = { mirror = false },
      vertical = { mirror = false }
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-e>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-e>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      }
    }
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
      hidden = true,
      no_ignore = false,
      no_ignore_parent = false
    }
  },
  extensions = {
    frecency = {
      ignore_patterns = { "*.git/*", "*/tmp/*", "*/.elixir_ls/*" }
    },
    file_browser = {
       -- hijack_netrw = true,
      mappings = {
        [ "i" ] = {
          ["<C-o>"] = "select_default",
          ["<C-d>"] = fb_actions.remove
        },
        [ "n" ] = {
          ["<CR>"] = actions.select_default + actions.center,
        }
      }
    }
  },

}
require "telescope".load_extension("frecency")
require "telescope".load_extension("file_browser")
