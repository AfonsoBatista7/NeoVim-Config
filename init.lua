local config_dir = vim.fn.stdpath("config")

-- Importing Lua Configuration Files
require("core.plugins")

-- Importing Keymaps and Settings
package.loaded["core.settings"] = nil
require("core.settings")
require("core.keymaps")

-- Importing Vim scripts
vim.cmd.source(config_dir .. "/functions.vim")
