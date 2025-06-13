{
  config,
  lib,
  flake,
  ...
}: let
  inherit (flake.config.me) namespace;
in {
  options.${namespace}.terminal.editors.neovim = {
    lazyvim.enable = lib.mkEnableOption "neovim.lazyvim";
    nvchad.enable = lib.mkEnableOption "neovim.nvchad";
  };
  config = lib.mkMerge [
    (lib.mkIf (
        config.${namespace}.terminal.editors.neovim.lazyvim.enable
        || config.${namespace}.terminal.editors.neovim.nvchad.enable
      ) {
        home.sessionVariables.EDITOR = "nvim";
        home.shellAliases.vi = "nvim";
      })
    {
      programs = lib.mkMerge [
        (lib.mkIf config.${namespace}.terminal.editors.neovim.lazyvim.enable {
          lazyvim = {
            enable = true;
            extras = {
              coding.yanky.enable = true;
              util.mini-hipatterns.enable = true;
              editor = {
                dial.enable = true;
                inc-rename.enable = true;
              };
              lang = {
                nix.enable = true;
                markdown.enable = true;
              };
              ai = {
                copilot.enable = true;
                copilot-chat.enable = true;
              };
            };
          };
        })
        (lib.mkIf config.${namespace}.terminal.editors.neovim.nvchad.enable {
          nvchad = {
            enable = true;
            backup = false;
          };
        })
      ];
    }
  ];
}
