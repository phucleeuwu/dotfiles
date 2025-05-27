{
  config,
  flake,
  ...
}: {
  programs.hyprlock = {
    inherit (config.${flake.config.me.namespace}.WMs.linux) enable;
  };
}
