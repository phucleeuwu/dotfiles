_: {
  programs.lazyvim = {
    enable = true;
    extras = {
      coding = {
        yanky.enable = true;
      };
      lang = {
        nix.enable = true;
      };
    };
  };
}
