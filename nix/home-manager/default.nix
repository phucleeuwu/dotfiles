{ config, pkgs, lib, ... }:

let
  # 🔹 Categorized program definitions (easy to edit)
  programs = {
    shell = [ "fish" "nushell" "zsh" ];
    cli = [ "atuin" "bat" "eza" "fd" "fzf" "helix" "lazygit" "neovim" "git"
            "oh-my-posh" "ripgrep" "starship" "yazi" "zoxide" ];
    gui = [ "aerospace" "ghostty" ];
  };

  # 🔹 Default enable settings (edit here to change behavior)
  defaults = {
    shell = false;   # Shell disabled by default
    cli = true;       # CLI tools enabled by default
    gui = true;       # GUI apps enabled by default
    aerospace = false; # ❌ Aerospace is explicitly disabled
  };

  # 🔹 Function to determine category
  getCategory = name:
    if builtins.elem name programs.shell then "shell"
    else if builtins.elem name programs.cli then "cli"
    else "gui";

  # 🔹 Function to determine if a program is enabled by default
  getDefault = name:
    if builtins.hasAttr name defaults then defaults.${name}
    else defaults.${getCategory name};

  # 🔹 Generate program entries dynamically
  mkProgram = name:
    let category = getCategory name;
    in {
      inherit name;
      default = getDefault name;
      path = ./${category}/${name}.nix;
      pkg = pkgs.${name};
    };

  # 🔹 Build program list
  programsList = map mkProgram (programs.shell ++ programs.cli ++ programs.gui);

  # 🔹 Generate options dynamically
  optionsList = builtins.listToAttrs (map (p: {
    name = p.name;
    value = { enable = lib.mkEnableOption "Enable ${p.name}" // { default = p.default; }; };
  }) programsList);

  # 🔹 Generate configs dynamically
  configList = builtins.listToAttrs (map (p: {
    name = p.name;
    value = lib.mkIf config.${p.name}.enable (import p.path { inherit config pkgs; });
  }) programsList);

  # 🔹 Generate package list dynamically (Neovim excluded)
  packagesList = map (p: p.pkg)
    (builtins.filter (p: config.${p.name}.enable && p.name != "neovim") programsList);

in {
  options = optionsList;
  config = {
    programs = configList;
    home.packages = packagesList;
  };
}
