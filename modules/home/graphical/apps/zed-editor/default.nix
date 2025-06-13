{
  config,
  lib,
  flake,
  ...
}: {
  options.${flake.config.me.namespace}.graphical.apps.zed-editor.enable = lib.mkEnableOption "zed-editor";
  config = lib.mkIf config.${flake.config.me.namespace}.graphical.apps.zed-editor.enable {
    programs.zed-editor = {
      enable = true;
      userSettings = {
        vim_mode = true;
        relative_line_numbers = true;
        buffer_font_family = "Maple Mono";
        ui_font_size = 18;
        buffer_font_size = 18;
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
          font_family = "Maple Mono";
        };
      };
      extensions = [
        "git-firefly"
        "lua"
        "toml"
        "nix"
      ];
    };
  };
}
