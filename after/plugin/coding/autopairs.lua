require("nvim-autopairs").setup({})

local rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")

npairs.add_rule(rule("$", "$", "tex"))
