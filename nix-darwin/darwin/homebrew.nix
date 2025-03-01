{ config, ... }:

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
    onActivation.cleanup = "zap";
  };
}
