{flake, ...}: {
  nix-homebrew = {
    enable = true;
    user = "${flake.config.me.username}";
    autoMigrate = true;
  };
  homebrew = {
    enable = true;
    casks = [
      "ghostty"
      "chatgpt"
      "raycast"
      "sf-symbols"
      "arc"
      "zen"
      "ubersicht"
    ];
    onActivation = {
      cleanup = "zap"; # Declarative nature of homebrew
      upgrade = true;
    };
  };
}
