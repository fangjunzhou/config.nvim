return {
  {
    "goerz/jupytext.vim",
    init = function()
      -- Setup jupytext.
      vim.g["jupytext_fmt"] = "py:percent"
    end,
  },
  {
    "GCBallesteros/vim-textobj-hydrogen",
    dependencies = {
      "kana/vim-textobj-user",
    },
  },
  {
    "hkupty/iron.nvim",
    init = function()
      local iron = require("iron.core")
      iron.setup({
        config = {
          should_map_plug = false,
          scratch_repl = true,
          repl_definition = {
            python = {
              command = { "ipython" },
              format = require("iron.fts.common").bracketed_paste,
            },
          },
        },
        keymaps = {
          send_motion = "<space>r<cr>",
          visual_send = "<space>r<cr>",
          interrupt = "<space>r<space>",
        },
      })
    end,
  },
}
