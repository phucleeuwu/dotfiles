{ config, ... }:

{
  homebrew = {
    enable = true;
    brews = [ 
      
    ];
    casks = [
      "zed"
      "ayugram"
      "chatgpt"
      "arc"
      "ghostty"
      "karabiner-elements"
      "messenger"
    ];
    onActivation.cleanup = "zap";
  };
}
