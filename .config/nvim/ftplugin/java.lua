-- local lombok_path = '~/.local/share/nvim/mason/packages/jdtls/lombok.jar'
-- local config = {
--     cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls'),'-javaagent:' .. lombok_path},
--     root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
-- }
-- require('jdtls').start_or_attach(config)

local mason_path = vim.fn.expand('~/.local/share/nvim/mason')
local lombok_path = mason_path .. '/packages/jdtls/lombok.jar'

-- Ensure lombok.jar exists; if not, download it
if not vim.loop.fs_stat(lombok_path) then
    vim.notify('Lombok.jar not found at ' .. lombok_path .. '. Please ensure it is installed.', vim.log.levels.WARN)
end

local config = {
    cmd = {
        vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls'),
        '--jvm-arg=-javaagent:' .. lombok_path, -- Correct way to pass javaagent
    },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]) or vim.fn.getcwd(),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    -- Optional: Configure Java runtimes if needed
                    {
                        name = 'JavaSE-21', -- Adjust to your Java version
                        path = '/usr/lib/jvm/java-21-openjdk-21.0.5.0.11-1.fc39.x86_64', -- Replace with your JDK path
                    },
                },
            },
        },
    },
}

require('jdtls').start_or_attach(config)
