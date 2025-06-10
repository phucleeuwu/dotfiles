{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.atuin.enable = lib.mkEnableOption "cli.atuin";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.atuin.enable {
    programs.atuin = {
      enable = true;
      settings = {
        records = true;
        inline_height = 20;
        enter_accept = true;
        keymap_mode = "vim-insert";
      };
    };
  };
}
