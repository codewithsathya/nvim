-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.sql" },

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.editing-support.auto-save-nvim" },

  { import = "astrocommunity.motion.hop-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.nvim-spider" },
}
