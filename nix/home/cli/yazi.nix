{pkgs, ...}: {
  enable = true;
  enableZshIntegration = true;
  enableFishIntegration = true;
  enableNushellIntegration = true;
  shellWrapperName = "y";
  initLua = ../../../yazi/init.lua;
  plugins = {
    compress = ../../../yazi/plugins/compress.yazi;
    fg = ../../../yazi/plugins/fg.yazi;
    full-border = ../../../yazi/plugins/full-border.yazi;
    git = ../../../yazi/plugins/git.yazi;
    searchjump = ../../../yazi/plugins/searchjump.yazi;
    yatline-githead = ../../../yazi/plugins/yatline-githead.yazi;
    yatline = ../../../yazi/plugins/yatline.yazi;
  };

  #yazi.toml
  settings = {
    manager = {
      ratio = [1 3 4];
      show_hidden = true;
    };
    preview = {
      max_width = 1200;
      max_height = 1000;
    };
    opener = {
      edit = [
        {
          run = "${pkgs.neovim}/bin/nvim \"$@\"";
          desc = "$EDITOR";
          block = true;
          for = "unix";
        }
      ];
    };
  };

  #keymap.toml
  keymap = {
    "$schema" = "https://yazi-rs.github.io/schemas/keymap.json";
    manager = {
      prepend_keymap = [
        {
          on = ["!"];
          run = ''shell "$SHELL" --block'';
          desc = "Open shell here";
        }
        {
          on = ["c" "a"];
          run = "plugin compress";
          desc = "Archive selected files";
        }
        {
          on = "<C-u>";
          run = "seek -5";
          desc = "Seek up 5 units in the preview";
        }
        {
          on = "<C-d>";
          run = "seek 5";
          desc = "Seek down 5 units in the preview";
        }
        {
          on = "K";
          run = "arrow -50%";
          desc = "Move cursor up half page";
        }
        {
          on = "J";
          run = "arrow 50%";
          desc = "Move cursor down half page";
        }
        {
          on = "<A-k>";
          run = "arrow -5";
          desc = "Move cursor up";
        }
        {
          on = "<A-j>";
          run = "arrow 5";
          desc = "Move cursor down";
        }
        {
          on = ["f" "g"];
          run = "plugin fg";
          desc = "Find file by content (fuzzy match)";
        }
        {
          on = ["f" "f"];
          run = "filter --smart";
          desc = "Filter files";
        }
        {
          on = ["s"];
          run = "plugin searchjump";
          desc = "Flash";
        }
        {
          on = "S";
          run = "search --via=fd";
          desc = "Search files by name using fd";
        }
        {
          on = ["<C-y>"];
          run = ''shell -- for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list'';
          desc = "Copy to clipboard";
        }
        {
          on = "A";
          run = "create --dir";
          desc = "Create a dir";
        }
        {
          on = ["g" "r"];
          run = ''shell -- ya emit cd "$(git rev-parse --show-toplevel)"'';
          desc = "Root of Git Repo";
        }
        {
          on = "H";
          run = "tab_switch -1 --relative";
          desc = "Switch to the previous tab";
        }
        {
          on = "L";
          run = "tab_switch 1 --relative";
          desc = "Switch to the next tab";
        }
        {
          on = "<";
          run = "tab_swap -1";
          desc = "Swap current tab with previous tab";
        }
        {
          on = ">";
          run = "tab_swap 1";
          desc = "Swap current tab with next tab";
        }
      ];
      append_keymap = [
        {
          on = ["e"];
          run = "open";
          desc = "Open the selected files";
        }
        {
          on = ["E"];
          run = "open --interactive";
          desc = "Open the selected files interactively";
        }
      ];
    };
    completion = {
      prepend_keymap = [
        {
          on = "<C-k>";
          run = "arrow -1";
          desc = "Move cursor up";
        }
        {
          on = "<C-j>";
          run = "arrow 1";
          desc = "Move cursor down";
        }
      ];
    };
  };
}
