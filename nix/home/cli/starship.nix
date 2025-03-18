_: {
  enable = true;
  enableFishIntegration = true;
  enableNushellIntegration = true;
  enableZshIntegration = true;
  enableTransience = true;
  settings = {
    add_newline = false;
    format = "$directory$character";
    # palette = "catppuccin_mocha";
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
  };
}
