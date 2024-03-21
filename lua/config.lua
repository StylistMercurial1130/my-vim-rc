local set = vim.opt
local vim_global = vim.g

function startup()
	set.relativenumber = true
	set.tabstop = 4	
	set.shiftwidth = 4
	vim.cmd("noh");
	vim_global.mapleader = " "
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
end
startup()


