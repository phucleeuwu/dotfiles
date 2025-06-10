{
  config,
  flake,
  ...
}: {
  services.jankyborders = {
    inherit (config.${flake.config.me.namespace}.WM.darwin) enable;
    settings = {
      order = "below";
      active_color = "0xffcba6f7";
    };
  };
}
