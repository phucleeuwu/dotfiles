{flake, ...}: {
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        inherit (flake.config.me) name;
        inherit (flake.config.me) email;
      };
    };
  };
}
