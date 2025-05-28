{
  config,
  flake,
  ...
}: {
  programs.hyprlock = {
    inherit (config.${flake.config.me.namespace}.WM.linux) enable;
  };
}
