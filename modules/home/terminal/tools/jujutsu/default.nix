{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.cli.jujutsu.enable = lib.mkEnableOption "jujutsu";
  config = lib.mkIf config.${flake.config.me.namespace}.cli.jujutsu.enable {
    programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          inherit (flake.config.me) name;
          inherit (flake.config.me) email;
        };
      };
    };
  };
}
