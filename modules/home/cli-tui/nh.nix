_: {
  programs.nh = {
    enable = true;
    flake = builtins.toString ../../..;
    clean = {
      enable = true;
    };
  };
}
