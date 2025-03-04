{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;
    brews = [

    ];
    casks = [
      "zed"
      "ghostty"
      "karabiner-elements"
      "messenger"
    ];
    # Declarative nature of homebrew
    onActivation.cleanup = "zap";
  };
}
