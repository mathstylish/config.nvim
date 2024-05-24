require "user.core.options"
require "user.core.keymaps"
require "user.core.autocmds"

require "user.launch"

spec "user.core.treesitter"

spec "user.ui.theme"
spec "user.ui.lualine"
spec "user.ui.indentline"
spec "user.ui.indentscope"

spec "user.extras.ui.nui"
spec "user.extras.ui.noice"
spec "user.extras.ui.dressing"

spec "user.editor.whichkey"
spec "user.editor.telescope"
spec "user.editor.spectre"
spec "user.editor.flash"
spec "user.editor.neotree"

spec "user.coding.cmp"
spec "user.coding.autopairs"
spec "user.coding.comment"
spec "user.coding.surround"

spec "user.lsp.mason"
spec "user.lsp.lspconfig"
spec "user.extras.lsp.typescript-tools"

require "user.lazy"
