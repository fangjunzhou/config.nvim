return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    local mappings = opts.window.mappings
    mappings["<tab>"] = function(state)
      local node = state.tree:get_node()
      if require("neo-tree.utils").is_expandable(node) then
        state.commands["toggle_node"](state)
      else
        state.commands["open"](state)
        vim.cmd("Neotree reveal")
      end
    end
    mappings["h"] = function(state)
      local node = state.tree:get_node()
      if node.type == "directory" and node:is_expanded() then
        require("neo-tree.sources.filesystem").toggle_directory(state, node)
      else
        require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
      end
    end
    mappings["l"] = function(state)
      local node = state.tree:get_node()
      if node.type == "directory" then
        if not node:is_expanded() then
          require("neo-tree.sources.filesystem").toggle_directory(state, node)
        elseif node:has_children() then
          require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
        end
      end
    end
    mappings["s"] = ""
    mappings["S"] = ""

    opts.filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    }
  end,
}
