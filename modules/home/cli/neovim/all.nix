{
  config,
  flake,
  ...
}: {
  programs.lazyvim = {
    inherit (config.${flake.config.me.namespace}.editor.neovim.lazyvim) enable;
    extras = {
      coding.yanky.enable = true;
      util.mini-hipatterns.enable = true;
      editor = {
        dial.enable = true;
        inc-rename.enable = true;
      };
      lang = {
        nix.enable = true;
        markdown.enable = true;
      };
      ai = {
        copilot.enable = true;
        copilot-chat.enable = true;
      };
    };
  };
  programs.nvchad = {
    inherit (config.${flake.config.me.namespace}.editor.neovim.nvchad) enable;
    backup = false;
  };
}
