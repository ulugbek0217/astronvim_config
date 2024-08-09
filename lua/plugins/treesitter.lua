-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "go",
      "python",
      "javascript",
      "c",
      "cpp",
      "html",
      "css",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
