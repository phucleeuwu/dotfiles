{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      aerospace-fork = prev.callPackage ./aerospace-fork.nix {};
    })
  ];

  # 1. using hm to manage the config because we don't want to restart the service every time we change the config
  # 2. not using services.aerospace because we want to override default config path
  environment.systemPackages = [pkgs.aerospace-fork];
  launchd.user.agents.aerospace = {
    command = "${pkgs.aerospace-fork}/Applications/AeroSpace.app/Contents/MacOS/AeroSpace";
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
    };
  };
}
