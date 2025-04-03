_: {
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        color.separator = "blue";
        separator = " | ";
      };
      modules = [
        "break"
        "break"
        {
          type = "kernel";
          key = " Phuc Lee   ";
          keyColor = "magenta";
        }
        {
          type = "custom";
          format = ">-----------<+>------------------------------------------<";
          outputColor = "separator";
        }
        {
          type = "host";
          key = "  MRB      ";
          keyColor = "cyan";
        }
        {
          type = "memory";
          key = "  RAM      ";
          keyColor = "cyan";
        }
        {
          type = "cpu";
          key = "󰍛  CPU      ";
          showPeCoreCount = true;
          keyColor = "cyan";
        }
        {
          type = "gpu";
          key = "󰍛  GPU      ";
          keyColor = "cyan";
        }
        {
          type = "custom";
          format = ">-----------<+>------------------------------------------<";
          outputColor = "separator";
        }
        {
          type = "wmtheme";
          key = "󰉼  Theme    ";
          keyColor = "green";
        }
        {
          type = "shell";
          key = "  Shell    ";
          keyColor = "green";
        }
        {
          type = "wm";
          key = "  Session  ";
          keyColor = "green";
        }
        {
          type = "terminal";
          key = "  Terminal ";
          keyColor = "green";
        }
        {
          type = "de";
          key = "  Desktop  ";
          keyColor = "green";
        }
        {
          type = "packages";
          key = "󰏖  Packages ";
          keyColor = "green";
        }
        {
          type = "gpu";
          key = "󰍛  G-Driver ";
          format = "{3}";
          keyColor = "green";
        }
        {
          type = "custom";
          format = ">-----------<+>------------------------------------------<";
          outputColor = "separator";
        }
        {
          type = "command";
          key = "󰅐  OS Age   ";
          keyColor = "blue";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "󰅐  Uptime   ";
          keyColor = "blue";
        }
        {
          type = "custom";
          format = ">-----------<+>------------------------------------------<";
          outputColor = "separator";
        }
        "break"
        "break"
      ];
    };
  };
}
