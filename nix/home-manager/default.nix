{ config, pkgs, lib, ... }: 

# enable or disable each program in `home.nix` default is true
{
  options = {
    #shell
    fish.enable = lib.mkEnableOption "Enable Fish" // { default = false; };
    nushell.enable = lib.mkEnableOption "Enable Nushell" // { default = false; };
    zsh.enable = lib.mkEnableOption "Enable Zsh" // { default = false; };

    #cliPrograms
    atuin.enable = lib.mkEnableOption "Enable Atuin" // { default = true; };
    bat.enable = lib.mkEnableOption "Enable Bat" // { default = true; };
    eza.enable = lib.mkEnableOption "Enable Eza" // { default = true; };
    fd.enable = lib.mkEnableOption "Enable Fd" // { default = true; };
    fzf.enable = lib.mkEnableOption "Enable Fzf" // { default = true; };
    git.enable = lib.mkEnableOption "Enable Git" // { default = true; };
    oh-my-posh.enable = lib.mkEnableOption "Enable Oh My Posh" // { default = true; };
    ripgrep.enable = lib.mkEnableOption "Enable Ripgrep" // { default = true; };
    starship.enable = lib.mkEnableOption "Enable Starship" // { default = true; };
    yazi.enable = lib.mkEnableOption "Enable Yazi" // { default = true; };
    zoxide.enable = lib.mkEnableOption "Enable Zoxide" // { default = true; };

    #guiPrograms
    aerospace.enable = lib.mkEnableOption "Enable Aerospace" // { default = true; };
    ghostty.enable = lib.mkEnableOption "Enable Ghostty" // { default = true; };
  };

  config = {
    programs = {
      #shell
      fish = lib.mkIf config.fish.enable (import ./shells/fish.nix { inherit config pkgs; });
      nushell = lib.mkIf config.nushell.enable (import ./shells/nushell.nix { inherit config pkgs; });
      zsh = lib.mkIf config.zsh.enable (import ./shells/zsh.nix { inherit config pkgs; });

      #cliPrograms
      atuin = lib.mkIf config.atuin.enable (import ./cliPrograms/atuin.nix { inherit config pkgs; });
      bat = lib.mkIf config.bat.enable (import ./cliPrograms/bat.nix { inherit config pkgs; });
      eza = lib.mkIf config.eza.enable (import ./cliPrograms/eza.nix { inherit config pkgs; });
      fd = lib.mkIf config.fd.enable (import ./cliPrograms/fd.nix { inherit config pkgs; });
      fzf = lib.mkIf config.fzf.enable (import ./cliPrograms/fzf.nix { inherit config pkgs; });
      git = lib.mkIf config.git.enable (import ./cliPrograms/git.nix { inherit config pkgs; });
      oh-my-posh = lib.mkIf config.oh-my-posh.enable (import ./cliPrograms/oh-my-posh.nix { inherit config pkgs; });
      ripgrep = lib.mkIf config.ripgrep.enable (import ./cliPrograms/ripgrep.nix { inherit config pkgs; });
      starship = lib.mkIf config.starship.enable (import ./cliPrograms/starship.nix { inherit config pkgs; });
      yazi = lib.mkIf config.yazi.enable (import ./cliPrograms/yazi/yazi.nix { inherit config pkgs; });
      zoxide = lib.mkIf config.zoxide.enable (import ./cliPrograms/zoxide.nix { inherit config pkgs; });

      #guiPrograms
      aerospace = lib.mkIf config.aerospace.enable (import ./guiPrograms/aerospace.nix { inherit config pkgs; });
      ghostty = lib.mkIf config.ghostty.enable (import ./guiPrograms/ghostty.nix { inherit config pkgs; });
    };
  };
}
