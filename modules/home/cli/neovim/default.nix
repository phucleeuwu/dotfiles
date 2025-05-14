{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.neovim = {
    lazyvim.enable = lib.mkEnableOption "neovim.lazyvim";
    nvchad.enable = lib.mkEnableOption "neovim.nvchad";
  };
  config = lib.mkMerge [
    (lib.mkIf config.${flake.config.me.namespace}.cli.neovim.lazyvim.enable {
      programs.lazyvim = {
        enable = true;
        extras = {
          coding = {
            yanky.enable = true;
          };
          lang = {
            nix.enable = true;
            markdown.enable = true;
          };
          ai = {
            # copilot.enable = true;
            copilot-chat.enable = true;
          };
          editor = {
            leap.enable = true;
          };
        };
      };
    })
    (lib.mkIf config.${flake.config.me.namespace}.cli.neovim.nvchad.enable {
      programs.nvchad = {
        enable = true;
        backup = false;
      };
    })
  ];
}
