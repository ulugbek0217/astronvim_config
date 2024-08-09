-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- enable clipboard
vim.opt.clipboard = "unnamedplus"

-- Copy selected text to clipboard
vim.api.nvim_set_keymap("v", "<C-S-c>", '"+y', { noremap = true, silent = true })

-- Cut selected text to clipboard
vim.api.nvim_set_keymap("v", "<C-S-x>", '"+d', { noremap = true, silent = true })

-- Paste from sytem clipboard
vim.api.nvim_set_keymap("n", "<C-S-v>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-S-v>", '"+p', { noremap = true, silent = true })

require "lazy_setup"
require "polish"
