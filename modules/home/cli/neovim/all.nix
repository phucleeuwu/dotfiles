{
  config,
  lib,
  flake,
  ...
}: {
      programs.lazyvim = {
        inherit (config.${flake.config.me.namespace}.editor.neovim.lazyvim) enable;
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
      programs.nvchad = {
        inherit (config.${flake.config.me.namespace}.editor.neovim.nvchad) enable;
        backup = false;
      };
}
