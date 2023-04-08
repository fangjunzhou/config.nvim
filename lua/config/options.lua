-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Setup treesitter code folding.
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Set the conceallevel.
opt.conceallevel = 0

-- Set wrap.
opt.wrap = true

--- Comment to add a comment divider for cpp files.
---@param title the title of the comment divider.
---@param length the length of the comment divider.
local function CppCommentDivider(opts)
  -- Get values for opts.
  local title = opts.args
  local length = 64
  -- Get the length of the title.
  local titleLen = string.len(title)
  -- Check if the title is longer than the length.
  if titleLen > length - 10 then
    return
  end

  -- The divider line length.
  local lineLength = length - 8
  -- Left divider line length.
  local leftLineLength = (lineLength - titleLen + 1) / 2
  local rightLineLength = lineLength - leftLineLength - titleLen

  -- Construct line
  local commentDividerStr = "/* "
  for i = 1, leftLineLength do
    commentDividerStr = commentDividerStr .. "-"
  end
  commentDividerStr = commentDividerStr .. " " .. title .. " "
  for i = 1, rightLineLength do
    commentDividerStr = commentDividerStr .. "-"
  end
  commentDividerStr = commentDividerStr .. " */"
  vim.api.nvim_set_current_line(commentDividerStr)
end

vim.api.nvim_create_user_command("CommentDivider", CppCommentDivider, {
  nargs = "?",
})
