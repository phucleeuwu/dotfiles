_:

{
  homebrew = {
    enable = true;
    brews = [
      "statix"
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
