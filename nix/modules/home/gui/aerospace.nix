{
  lib,
  pkgs,
  ...
}: let
  sketchybar = "${pkgs.sketchybar}/bin/sketchybar";
in {
  programs.aerospace = {
    enable = true;
    package = pkgs.aerospace-fork;
    userSettings = {
      # fork special configs
      new-window-detection-timeout = 50;
      new-window-detection-debounce = 100;
      # main config
      start-at-login = false; # for aerospace-fork to work
      automatically-unhide-macos-hidden-apps = true;
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      accordion-padding = 80;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      key-mapping.preset = "qwerty";
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
      exec-on-workspace-change = [
        "/bin/bash"
        "-c"
        "${sketchybar} --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE"
      ];
      on-focus-changed = [
        "exec-and-forget ${sketchybar} --trigger aerospace_focus_change"
        "move-mouse window-lazy-center"
      ];
      gaps = {
        inner.horizontal = 10;
        inner.vertical = 10;
        outer.left = 5;
        outer.bottom = 45;
        outer.top = 5;
        outer.right = 5;
      };
      mode.main.binding =
        {
          "alt-shift-space" = "layout floating tiling";
          "alt-f" = "fullscreen";
          "alt-slash" = "layout tiles horizontal vertical";
          "alt-comma" = "layout accordion horizontal vertical";
          "alt-h" = "focus left";
          "alt-j" = "focus down";
          "alt-k" = "focus up";
          "alt-l" = "focus right";
          "alt-shift-h" = "move left";
          "alt-shift-j" = "move down";
          "alt-shift-k" = "move up";
          "alt-shift-l" = "move right";
          "alt-tab" = "workspace-back-and-forth";
          "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";
          "alt-r" = "mode resize";
          "alt-shift-semicolon" = "mode service";
        }
        # Dynamically generated workspace bindings
        // builtins.listToAttrs (
          builtins.concatLists (
            map (
              letter: let
                lower = lib.strings.toLower letter;
              in [
                {
                  name = "alt-${lower}";
                  value = "workspace ${letter}";
                }
                {
                  name = "alt-shift-${lower}";
                  value = "move-node-to-workspace ${letter}";
                }
              ]
            ) (lib.strings.stringToCharacters "1234AWE")
          )
        );
      mode.resize.binding = {
        "h" = "resize width -50";
        "j" = "resize height +50";
        "k" = "resize height -50";
        "l" = "resize width +50";
        "b" = "balance-sizes";
        "esc" = "mode main";
      };
      mode.service.binding = {
        "esc" = [
          "reload-config"
          "mode main"
        ];
        "r" = [
          "flatten-workspace-tree"
          "mode main"
        ];
        "backspace" = [
          "close-all-windows-but-current"
          "mode main"
        ];
        "alt-shift-h" = [
          "join-with left"
          "mode main"
        ];
        "alt-shift-j" = [
          "join-with down"
          "mode main"
        ];
        "alt-shift-k" = [
          "join-with up"
          "mode main"
        ];
        "alt-shift-l" = [
          "join-with right"
          "mode main"
        ];
      };
      # Automatic Window Assignment
      on-window-detected = [
        {
          "if".app-name-regex-substring = "wezterm|kitty|ghosty";
          run = "move-node-to-workspace W";
        }
        {
          "if".app-name-regex-substring = "arc";
          run = "move-node-to-workspace A";
        }
        {
          "if".app-name-regex-substring = "spotify";
          run = "move-node-to-workspace 2";
        }
        {
          "if".app-name-regex-substring = "finder";
          run = "move-node-to-workspace E";
        }
      ];
    };
  };
}
