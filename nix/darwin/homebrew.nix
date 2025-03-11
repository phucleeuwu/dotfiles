{ ... }:

{
  homebrew = {
    enable = true;
    brews = [

    ];
    casks = [
      "ghostty"
      "karabiner-elements"
      "messenger"
    ];
    # Declarative nature of homebrew
    onActivation.cleanup = "zap";
  };
}
