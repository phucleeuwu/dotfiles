{
  pkgs,
  lib,
  ...
}: {
  programs.aerospace = {
    enable = true;
    userSettings = {
      start-at-login = true;
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      automatically-unhide-macos-hidden-apps = true;
      exec-on-workspace-change = ["/bin/bash" "-c" "${lib.getExe pkgs.sketchybar} --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE"];
      on-focus-changed = [
        "exec-and-forget ${lib.getExe pkgs.sketchybar} --trigger aerospace_focus_change"
        "move-mouse window-lazy-center"
      ];
      accordion-padding = 40;
      gaps = {
        inner = {
          horizontal = 10;
          vertical = 10;
        };
        outer = {
          top = 5;
          bottom = 45;
          left = 5;
          right = 5;
        };
      };
      mode.main.binding =
        {
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
          "alt-shift-space" = "layout floating tiling";
          "alt-f" = "fullscreen";
          "alt-slash" = "layout tiles horizontal vertical";
          "alt-comma" = "layout accordion horizontal vertical";
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
        "esc" = "mode main";
        "b" = ["balance-sizes" "mode main"];
        "h" = "resize width -50";
        "j" = "resize height +50";
        "k" = "resize height -50";
        "l" = "resize width +50";
      };
      mode.service.binding = {
        "esc" = ["reload-config" "mode main"];
        "r" = ["flatten-workspace-tree" "mode main"];
        "backspace" = ["close-all-windows-but-current" "mode main"];
        "alt-shift-h" = ["join-with left" "mode main"];
        "alt-shift-j" = ["join-with down" "mode main"];
        "alt-shift-k" = ["join-with up" "mode main"];
        "alt-shift-l" = ["join-with right" "mode main"];
      };
      on-window-detected = [
        {
          "if".app-name-regex-substring = "wezterm|kitty|ghostty";
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
