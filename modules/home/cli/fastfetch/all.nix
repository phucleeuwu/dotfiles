{
  config,
  lib,
  flake,
  ...
}: {
  programs.fastfetch = {
    inherit (config.${flake.config.me.namespace}.cli.fastfetch) enable;
    settings = lib.mkMerge [
      (lib.mkIf config.${flake.config.me.namespace}.cli.fastfetch.xero.enable {
        display = {
          color.separator = "blue";
          separator = " | ";
        };
        modules = [
          "break"
          "break"
          {
            type = "kernel";
            key = "    🐧Tux   ";
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
      })
      (lib.mkIf config.${flake.config.me.namespace}.cli.fastfetch.hyde.enable {
        display.separator = " : ";
        modules = [
          {
            type = "command";
            key = "  ";
            keyColor = "blue";
            text = "splash=$(hyprctl splash);echo $splash";
          }
          {
            type = "custom";
            format = "┌──────────────────────────────────────────┐";
          }
          {
            type = "chassis";
            key = "  󰇺 Chassis";
            format = "{1} {2} {3}";
          }
          {
            type = "os";
            key = "  󰣇 OS";
            format = "{2}";
            keyColor = "red";
          }
          {
            type = "kernel";
            key = "   Kernel";
            format = "{2}";
            keyColor = "red";
          }
          {
            type = "packages";
            key = "  󰏗 Packages";
            keyColor = "green";
          }
          {
            type = "display";
            key = "  󰍹 Display";
            format = "{1}x{2} @ {3}Hz [{7}]";
            keyColor = "green";
          }
          {
            type = "terminal";
            key = "   Terminal";
            keyColor = "yellow";
          }
          {
            type = "wm";
            key = "  󱗃 WM";
            format = "{2}";
            keyColor = "yellow";
          }
          {
            type = "custom";
            format = "└──────────────────────────────────────────┘";
          }
          "break"
          {
            type = "title";
            key = "  ";
            format = "{6} {7} {8}";
          }
          {
            type = "custom";
            format = "┌──────────────────────────────────────────┐";
          }
          {
            type = "cpu";
            key = "   CPU";
            format = "{1} @ {7}";
            keyColor = "blue";
          }
          {
            type = "gpu";
            key = "  󰊴 GPU";
            format = "{1} {2}";
            keyColor = "blue";
          }
          {
            type = "gpu";
            key = "   GPU Driver";
            format = "{3}";
            keyColor = "magenta";
          }
          {
            type = "memory";
            key = "   Memory ";
            keyColor = "magenta";
          }
          {
            type = "disk";
            key = "  󱦟 OS Age ";
            folders = "/";
            format = "{days} days";
            keyColor = "red";
          }
          {
            type = "uptime";
            key = "  󱫐 Uptime ";
            keyColor = "red";
          }
          {
            type = "custom";
            format = "└──────────────────────────────────────────┘";
          }
          {
            type = "colors";
            paddingLeft = 2;
            symbol = "circle";
          }
          "break"
        ];
      })
      (lib.mkIf config.${flake.config.me.namespace}.cli.fastfetch.ml4w.enable {
        logo.padding.top = 2;
        display.separator = " ➜  ";
        modules = [
          "break"
          "break"
          "break"
          {
            type = "os";
            key = "OS   ";
            keyColor = "31";
          }
          {
            type = "kernel";
            key = " ├  ";
            keyColor = "31";
          }
          {
            type = "shell";
            key = " └  ";
            keyColor = "31";
          }
          "break"
          {
            type = "wm";
            key = "WM   ";
            keyColor = "32";
          }
          {
            type = "wmtheme";
            key = " ├ 󰉼 ";
            keyColor = "32";
          }
          {
            type = "icons";
            key = " ├ 󰀻 ";
            keyColor = "32";
          }
          {
            type = "cursor";
            key = " ├  ";
            keyColor = "32";
          }
          {
            type = "terminal";
            key = " ├  ";
            keyColor = "32";
          }
          {
            type = "terminalfont";
            key = " └  ";
            keyColor = "32";
          }
          "break"
          {
            type = "host";
            format = "{5} {1} Type {2}";
            key = "PC   ";
            keyColor = "33";
          }
          {
            type = "cpu";
            format = "{1} ({3}) @ {7} GHz";
            key = " ├  ";
            keyColor = "33";
          }
          {
            type = "gpu";
            format = "{1} {2} @ {12} GHz";
            key = " ├ 󰢮 ";
            keyColor = "33";
          }
          {
            type = "memory";
            key = " ├  ";
            keyColor = "33";
          }
          {
            type = "swap";
            key = " ├ 󰓡 ";
            keyColor = "33";
          }
          {
            type = "disk";
            key = " ├ 󰋊 ";
            keyColor = "33";
          }
          {
            type = "monitor";
            key = " └  ";
            keyColor = "33";
          }
          "break"
          "break"
        ];
      })
      (lib.mkIf config.${flake.config.me.namespace}.cli.fastfetch.jakoolit.enable {
        display.separator = " 󰑃  ";
        modules = [
          "break"
          {
            type = "os";
            key = " DISTRO";
            keyColor = "yellow";
          }
          {
            type = "kernel";
            key = "│ ├";
            keyColor = "yellow";
          }
          {
            type = "packages";
            key = "│ ├󰏖";
            keyColor = "yellow";
          }
          {
            type = "shell";
            key = "│ └";
            keyColor = "yellow";
          }
          {
            type = "wm";
            key = " DE/WM";
            keyColor = "blue";
          }
          {
            type = "wmtheme";
            key = "│ ├󰉼";
            keyColor = "blue";
          }
          {
            type = "icons";
            key = "│ ├󰀻";
            keyColor = "blue";
          }
          {
            type = "cursor";
            key = "│ ├";
            keyColor = "blue";
          }
          {
            type = "terminalfont";
            key = "│ ├";
            keyColor = "blue";
          }
          {
            type = "terminal";
            key = "│ └";
            keyColor = "blue";
          }
          {
            type = "host";
            key = "󰌢 SYSTEM";
            keyColor = "green";
          }
          {
            type = "cpu";
            key = "│ ├󰻠";
            keyColor = "green";
          }
          {
            type = "gpu";
            key = "│ ├󰻑";
            format = "{2}";
            keyColor = "green";
          }
          {
            type = "display";
            key = "│ ├󰍹";
            keyColor = "green";
            compactType = "original-with-refresh-rate";
          }
          {
            type = "memory";
            key = "│ ├󰾆";
            keyColor = "green";
          }
          {
            type = "swap";
            key = "│ ├󰓡";
            keyColor = "green";
          }
          {
            type = "uptime";
            key = "│ ├󰅐";
            keyColor = "green";
          }
          {
            type = "display";
            key = "│ └󰍹";
            keyColor = "green";
          }
          {
            type = "sound";
            key = " AUDIO";
            format = "{2}";
            keyColor = "magenta";
          }
          {
            type = "player";
            key = "│ ├󰥠";
            keyColor = "magenta";
          }
          {
            type = "media";
            key = "│ └󰝚";
            keyColor = "magenta";
          }
          {
            type = "custom";
            format = "{#90}  {#31}  {#32}  {#33}  {#34}  {#35}  {#36}  {#37}  {#38}  {#39}  {#39}    {#38}  {#37}  {#36}  {#35}  {#34}  {#33}  {#32}  {#31}  {#90} ";
          }
          "break"
        ];
      })
    ];
  };
}
