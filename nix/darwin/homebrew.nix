_:

{
  homebrew = {
    enable = true;
    brews = [
    ];
    casks = [
      "ghostty"
      "messenger"
    ];
    # Declarative nature of homebrew
    onActivation.cleanup = "zap";
  };
}
