{pkgs, ...}: {
  enable = true;
  extraPackages = with pkgs; [ #replace for mason.nvim
    nil
    lua-language-server
    stylua
  ];
  plugins = with pkgs.vimPlugins; [
    lazy-nvim
  ];
  extraLuaConfig = ''
    require("lazy").setup({
      defaults = {
        lazy = true,
      },
      dev = {
        -- reuse files from pkgs.vimPlugins.*
        patterns = { "" },
        -- fallback to download
        fallback = true,
      },
      spec = {
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- The following configs are needed for fixing lazyvim on nix
        -- disable mason.nvim, use config.extraPackages
        { "williamboman/mason-lspconfig.nvim", enabled = false },
        { "williamboman/mason.nvim", enabled = false },
        -- uncomment to import/override with your plugins
        -- { import = "plugins" },
        -- put this line at the end of spec to clear ensure_installed
        { "nvim-treesitter/nvim-treesitter", opts = function(_, opts) opts.ensure_installed = {} end },
      },
    })
  '';
}
