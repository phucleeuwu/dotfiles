{
  config,
  pkgs,
  lib,
  ...
}:

let
  # 🔹 Function to import all `.nix` modules from a directory
  importModules =
    dir:
    let
      files = builtins.attrNames (builtins.readDir dir);
    in
    map (file: {
      name = builtins.replaceStrings [ ".nix" ] [ "" ] file;
      path = dir + "/${file}";
    }) (builtins.filter (file: builtins.match ".*\\.nix" file != null) files);

  # 🔹 Categorized program imports
  programs = {
    shell = importModules ./shell;
    cli = importModules ./cli;
    gui = importModules ./gui;
  };

  # 🔹 Default enable settings
  defaults = {
    cli = true;
    gui = true;
    shell = false;
    starship = false;
    oh-my-posh = false;
    aerospace = false;
    delta = false;
    nh = false;
    lsd = false;
  };

  # 🔹 Function to determine category
  getCategory =
    name:
    if builtins.any (p: p.name == name) programs.shell then
      "shell"
    else if builtins.any (p: p.name == name) programs.cli then
      "cli"
    else
      "gui";

  # 🔹 Function to determine if a program is enabled by default
  getDefault =
    name: if builtins.hasAttr name defaults then defaults.${name} else defaults.${getCategory name};

  # 🔹 Generate program entries dynamically
  mkProgram = p: {
    inherit (p) name path;
    default = getDefault p.name;
    pkg = pkgs.${p.name};
  };

  # 🔹 Build program list
  programsList = map mkProgram (programs.shell ++ programs.cli ++ programs.gui);

  # 🔹 Generate options dynamically
  optionsList = builtins.listToAttrs (
    map (p: {
      inherit (p) name;
      value = {
        enable = lib.mkEnableOption "Enable ${p.name}" // {
          inherit (p) default;
        };
      };
    }) programsList
  );

  # 🔹 Generate configs dynamically
  configList = builtins.listToAttrs (
    map (p: {
      inherit (p) name;
      value = lib.mkIf config.${p.name}.enable (import p.path { inherit config pkgs lib; });
    }) programsList
  );

  # 🔹 Generate package list dynamically (Neovim excluded)
  excludedPrograms = [
    "lazyvim"
    "nixvim"
  ]; # List of programs to exclude
  packagesList = map (p: p.pkg) (
    builtins.filter (
      p: config.${p.name}.enable && !(builtins.elem p.name excludedPrograms)
    ) programsList
  );

in
{
  imports = [
    ./packages.nix # Packages list
    ./env.nix # Session variables
    ./aliases.nix # ShellAliases
  ];
  options = optionsList;
  config = {
    programs = configList;
    home.packages = packagesList;
  };
}
