{ lib, pkgs, ... }:

{
  enable = true;
  enableMan = false;
  withPython3 = false;
  withRuby = false;

  extraPackages = with pkgs; [
    lua-language-server
    stylua
    ripgrep
  ];

  extraPlugins = [ pkgs.vimPlugins.lazy-nvim ];

  extraConfigLua =
    let
      plugins = with pkgs.vimPlugins; [
        LazyVim
        nvim-treesitter
        snacks-nvim
        bufferline-nvim
        cmp-buffer
        cmp-nvim-lsp
        cmp-path
        conform-nvim
        dashboard-nvim
        dressing-nvim
        flash-nvim
        friendly-snippets
        gitsigns-nvim
        grug-far-nvim
        indent-blankline-nvim
        lazydev-nvim
        lualine-nvim
        luvit-meta
        neo-tree-nvim
        noice-nvim
        nui-nvim
        nvim-cmp
        nvim-lint
        nvim-lspconfig
        nvim-snippets
        nvim-treesitter
        nvim-treesitter-textobjects
        nvim-ts-autotag
        persistence-nvim
        plenary-nvim
        snacks-nvim
        telescope-fzf-native-nvim
        telescope-nvim
        todo-comments-nvim
        tokyonight-nvim
        trouble-nvim
        ts-comments-nvim
        which-key-nvim
      ];
      mkEntryFromDrv = drv:
        if lib.isDerivation drv then
          { name = "${lib.getName drv}"; path = drv; }
        else
          drv;
      lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
    in
    ''
      require("lazy").setup({
        defaults = {
          lazy = true,
        },
        dev = {
          -- reuse files from pkgs.vimPlugins.*
          path = "${lazyPath}",
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
