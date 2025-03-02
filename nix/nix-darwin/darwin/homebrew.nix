{ config, pkgs, ... }:

{
  homebrew = {
    enable = true;
    brews = [

    ];
    casks = [
      "zed"
      "chatgpt"
      "arc"
      "ghostty"
      "karabiner-elements"
      "messenger"
    ];
    # Declarative nature of homebrew
    onActivation.cleanup = "zap";
  };
}
