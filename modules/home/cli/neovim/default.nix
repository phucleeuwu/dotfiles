{config, pkgs, lib, flake, ...}: {
  options.${flake.config.me.namespace}.cli.neovim.lazyvim.enable = lib.mkEnableOption "neovim.lazyvim";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.neovim.lazyvim.enable {
  programs.lazyvim = {
    enable = true;
    extras = {
      coding = {
        yanky.enable = true;
      };
      lang = {
        nix.enable = true;
      };
      ai = {
        copilot-chat.enable = true;
      };
      editor = {
        leap.enable = true;
      };
    };
  };
};
}
