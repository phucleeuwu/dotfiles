{ config, pkgs, ... }:

{
  enable = true;
  userSettings = {
    # Commands to run after login/startup
    after-login-command = [];
    after-startup-command = [];

    # Start at login
    start-at-login = true;

    # Normalization settings
    enable-normalization-flatten-containers = true;
    enable-normalization-opposite-orientation-for-nested-containers = true;

    # Layout & Orientation
    accordion-padding = 60;
    default-root-container-layout = "tiles";
    default-root-container-orientation = "auto";

    # Key Mapping
    key-mapping.preset = "qwerty";

    # Auto-move mouse to focused monitor/window
    on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
    on-focus-changed = [ "move-mouse window-lazy-center" ];

    # macOS Hidden Apps
    automatically-unhide-macos-hidden-apps = false;

    # Gaps Configuration
    gaps = {
      inner.horizontal = 8;
      inner.vertical = 8;
      outer = {
        left = 8;
        bottom = 8;
        top = 8;
        right = 8;
      };
    };

    # Main Key Bindings
    mode.main.binding = {
      "alt-shift-space" = "layout floating tiling";
      "alt-minus" = "resize smart -50";
      "alt-equal" = "resize smart +50";

      # Application Shortcuts
      "alt-g" = "exec-and-forget open -a /Applications/Ghostty.app";
      "alt-a" = "exec-and-forget open -a /Applications/Arc.app";
      "alt-z" = "exec-and-forget open -a /Applications/Zed.app";
      "alt-m" = "exec-and-forget open -a /Applications/Messenger.app";
      "alt-c" = "exec-and-forget open -a /Applications/ChatGPT.app";

      # Layout Switching
      "alt-slash" = "layout tiles horizontal vertical";
      "alt-comma" = "layout accordion horizontal vertical";

      # Window Focus
      "alt-h" = "focus left";
      "alt-j" = "focus down";
      "alt-k" = "focus up";
      "alt-l" = "focus right";

      # Move Windows
      "alt-shift-h" = "move left";
      "alt-shift-j" = "move down";
      "alt-shift-k" = "move up";
      "alt-shift-l" = "move right";

      # Workspaces
      "alt-1" = "workspace 1";
      "alt-2" = "workspace 2";
      "alt-3" = "workspace 3";
      "alt-4" = "workspace 4";
      "alt-shift-1" = "move-node-to-workspace 1";
      "alt-shift-2" = "move-node-to-workspace 2";
      "alt-shift-3" = "move-node-to-workspace 3";
      "alt-shift-4" = "move-node-to-workspace 4";

      # Fullscreen Toggle
      "alt-f" = "fullscreen";

      # Workspace Navigation
      "alt-tab" = "workspace-back-and-forth";
      "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";

      # Resize Mode
      "alt-shift-r" = "mode resize";
      "alt-shift-semicolon" = "mode service";
    };

    # Resize Mode
    mode.resize.binding = {
      "h" = "resize width -50";
      "j" = "resize height +50";
      "k" = "resize height -50";
      "l" = "resize width +50";
      "b" = "balance-sizes";
      "enter" = "mode main";
      "esc" = "mode main";
    };

    # Service Mode
    mode.service.binding = {
      "esc" = [ "reload-config" "mode main" ];
      "r" = [ "flatten-workspace-tree" "mode main" ];
      "backspace" = [ "close-all-windows-but-current" "mode main" ];
      "alt-shift-h" = [ "join-with left" "mode main" ];
      "alt-shift-j" = [ "join-with down" "mode main" ];
      "alt-shift-k" = [ "join-with up" "mode main" ];
      "alt-shift-l" = [ "join-with right" "mode main" ];
    };

    # Automatic Window Assignment
    on-window-detected = [
      { "if".app-id = "com.mitchellh.ghostty"; run = "move-node-to-workspace G"; }
      { "if".app-id = "company.thebrowser.Browser"; run = "move-node-to-workspace A"; }
      { "if".app-id = "com.spotify.client"; run = "move-node-to-workspace 4"; }
      { "if".app-id = "dev.zed.Zed"; run = "move-node-to-workspace Z"; }
      { "if".app-id = "com.facebook.archon.developerID"; run = "move-node-to-workspace M"; }
      { "if".app-id = "com.apple.finder"; run = "move-node-to-workspace 1"; }
      { "if".app-id = "com.apple.mail"; run = "move-node-to-workspace 2"; }
    ];
  };
}
