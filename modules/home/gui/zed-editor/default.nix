{
  config,
  pkgs,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.gui.editor.zed-editor.enable = lib.mkEnableOption "editor.zed-editor";
  config = lib.mkIf config.${flake.config.me.namespace}.gui.editor.zed-editor.enable {
    programs.zed-editor = {
      enable = true;
      userSettings = {
        vim_mode = true;
        relative_line_numbers = true;
        buffer_font_family = "Maple Mono NF";
        ui_font_size = 19;
        buffer_font_size = 19;
        edit_predictions = {
          mode = "eager_preview";
        };
        assistant = {
          default_model = {
            provider = "zed.dev";
            model = "claude-3-7-sonnet-latest";
          };
          version = "2";
        };
        features = {
          edit_prediction_provider = "zed";
        };
        telemetry = {
          diagnostics = false;
          metrics = false;
        };
        terminal = {
          dock = "bottom";
          font_family = "Maple Mono NF";
        };
      };
      extensions = [
        "html"
        "git-firefly"
        "lua"
        "toml"
      ];
    };
  };
}
