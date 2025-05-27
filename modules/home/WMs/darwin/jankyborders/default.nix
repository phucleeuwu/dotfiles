{config,lib,flake,...}: {
  services.jankyborders = {
    inherit (config.${flake.config.me.namespace}.WMs.darwin) enable;
    settings = {
      order = "below";
      active_color = "0xffcba6f7";
      inactive_color = "0xff1e1e2e";
      width = 8;
    };
  };
}
