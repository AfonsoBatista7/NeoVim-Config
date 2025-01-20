return function ()

    local telescope = require('telescope.builtin')

    local key_bindings = function(_, _)
        vim.keymap.set('n', '<leader>ff', telescope.find_files)
        vim.keymap.set('n', '<leader>en', function()
            telescope.find_files {
                cwd = vim.fn.stdpath("config")
            }
        end)
        vim.keymap.set('n', '<leader>zh', function()
            telescope.find_files {
                cwd = "~/"
            }
        end)
    end

    key_bindings()
end
