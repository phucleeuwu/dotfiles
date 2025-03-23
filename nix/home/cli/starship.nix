_: {
  enable = true;
  enableFishIntegration = true;
  enableNushellIntegration = true;
  enableZshIntegration = true;
  enableTransience = true;
  settings = {
    add_newline = false;
    format = "$directory$character";
    right_format = "$cmd_duration$git_status$all";
    command_timeout = 1000;

    character = {
      success_symbol = "[[󰄛](green) ❯](peach)";
      error_symbol = "[[󰄛](red) ❯](peach)";
      vimcmd_symbol = "[󰄛 ❮](subtext1)";
    };

    directory = {
      truncation_length = 4;
      style = "bold lavender";
      read_only = "󰌾";
    };

    git_metrics = {
      disabled = false;
    };

    cmd_duration = {
      min_time = 10000;
      format = "[ 󰚭 $duration ]($style)";
      style = "bold yellow";
    };

    git_branch = {
      style = "bold mauve";
    };
  };
}
