return {
  "postfen/clipboard-image.nvim",
  branch = "patch-1",
  opts = {
    -- Default configuration for all filetype.
    default = {
      img_dir = "images",
      img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end,
      affix = "%s"
    },
    -- Markdown configuration.
    markdown = {
      img_dir = { "images" },
      img_dir_txt = "images",
      img_handler = function(img)
      end,
      affix = "![](/%s)"
    }
  }
}
