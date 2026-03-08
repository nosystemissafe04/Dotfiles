--#this will check if the lazy pac man is installed or present in our system and if not it will clone this github repo 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)
require("vim-settings")
require("lazy").setup("plugins")
require("andsearch")
	

