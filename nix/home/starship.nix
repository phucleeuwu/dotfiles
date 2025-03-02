{ config, pkgs, ... }:

{
  enable = false;
  enableFishIntegration = true;
  enableNushellIntegration = true;
  enableZshIntegration = true;
  enableTransience = true;
  settings = {
    "$schema" = "https://starship.rs/config-schema.json";
    add_newline = false;
    format = "$directory$character";
    palette = "catppuccin_mocha";
    right_format = "$cmd_duration$git_status$all";
    command_timeout = 1000;

    character = {
      success_symbol = "[[󰄛](green) ❯](peach)";
      error_symbol = "[[󰄛](red) ❯](peach)";
      vimcmd_symbol = "[󰄛 ❮](subtext1)";
    };

    directory = {
      truncate_to_repo = false;
      truncation_length = 4;
      truncation_symbol = "…/";
      style = "bold lavender";
      read_only = " 󰌾 ";
    };

    git_metrics = {
      disabled = false;
      added_style = "green";
      deleted_style = "red";
      format = "(\([+$added]($added_style)/[-$deleted]($deleted_style)\)) ";
    };

    git_status = {
      ahead = "[ $count](bold green) ";
      conflicted = "[󱡂 ](bold red) ";
      untracked = "[ $count](bold purple) ";
      staged = "[ $count](bold green) ";
      stashed = "[ $count](cyan) ";
      deleted = "[ $count](bold red) ";
      modified = "[ $count](bold yellow) ";
      behind = "[ $count](bold yellow) ";
      renamed = "[󰬴 $count](bold blue) ";
      up_to_date = "[ ](bold green) ";
      diverged = "[ $ahead_count  $behind_count ](bold red) ";
      format = "([$all_status$ahead_behind]($style))";
    };

    git_branch = {
      format = "[$symbol$branch(:$remote_branch)]($style)";
      symbol = " ";
      style = "bold mauve";
    };

    cmd_duration = {
      min_time = 10000;
      format = "[ 󰚭 $duration ]($style)";
      style = "bold yellow";
    };

    palettes.catppuccin_mocha = {
      rosewater = "#f5e0dc";
      flamingo = "#f2cdcd";
      pink = "#f5c2e7";
      mauve = "#cba6f7";
      red = "#f38ba8";
      maroon = "#eba0ac";
      peach = "#fab387";
      yellow = "#f9e2af";
      green = "#a6e3a1";
      teal = "#94e2d5";
      sky = "#89dceb";
      sapphire = "#74c7ec";
      blue = "#89b4fa";
      lavender = "#b4befe";
      text = "#cdd6f4";
      subtext1 = "#bac2de";
      subtext0 = "#a6adc8";
      overlay2 = "#9399b2";
      overlay1 = "#7f849c";
      overlay0 = "#6c7086";
      surface2 = "#585b70";
      surface1 = "#45475a";
      surface0 = "#313244";
      base = "#1e1e2e";
      mantle = "#181825";
      crust = "#11111b";
    };
  };
}
