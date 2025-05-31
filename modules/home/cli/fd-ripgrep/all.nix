{
  config,
  flake,
  ...
}: {
  programs = {
    fd = {
    inherit (config.${flake.config.me.namespace}.cli.fd) enable;
    hidden = true;
    ignores = [
      ".git/"
      "*.bak"
    ];
  };
  ripgrep = {
    inherit (config.${flake.config.me.namespace}.cli.ripgrep) enable;
    arguments = [
      "--max-columns=150"
      "--max-columns-preview"
      "--hidden"
      "--glob=!.git/*"
      "--smart-case"
    ];
  };
  };
}
