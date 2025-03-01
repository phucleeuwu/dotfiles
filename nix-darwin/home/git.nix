{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    # Fetch Catppuccin Delta Git config
    includes = [
      { path = "${pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "delta";
          rev = "HEAD";  
          sha256 = "1d172w2y99gm598mk3z2qaa52zrgm2z2hp6jc4kcnm6v1v86i2nk";  # Replace this with the correct hash
        }}/catppuccin.gitconfig";
      }
    ];

    extraConfig = {
      delta = {
        features = "catppuccin-mocha";
        side-by-side = false;
        true-color = "always";
        hyperlinks = true;
        line-numbers = true;
      };

      credential.helper = "osxkeychain";
    };
  };
}
