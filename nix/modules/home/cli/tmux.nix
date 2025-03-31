_: {
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-a"; # Change the prefix key to Ctrl+A
    tmuxinator.enable = true; # Enable tmuxinator for session management
    keyMode = "vi"; # Enable Vi-style keybindings
  };
}
