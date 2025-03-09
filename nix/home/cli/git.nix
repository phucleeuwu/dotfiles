{ config, pkgs, ... }:

{
  enable = true;
  includes = [
    {
      path = "${pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "delta";
        rev = "HEAD";  # Use a specific commit hash
        sha256 = "1d172w2y99gm598mk3z2qaa52zrgm2z2hp6jc4kcnm6v1v86i2nk";  # Update if needed
      }}/catppuccin.gitconfig";
    }
  ];
  extraConfig = {
    init = {
      defaultBranch = "main";
    };
    delta = {
      features = "catppuccin-mocha";
      side-by-side = false;
      true-color = "always";
      hyperlinks = true;
      line-numbers = true;
    };
    credential.helper = "osxkeychain";  # macOS Keychain for credentials
  };
}
