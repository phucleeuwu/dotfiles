_:

{
  homebrew = {
    enable = true;
    brews = [
    ];
    casks = [
      "karabiner-elements"
      "ghostty"
      "messenger"
    ];
    # Declarative nature of homebrew
    onActivation.cleanup = "zap";
  };
}
