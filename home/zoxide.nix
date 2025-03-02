{ config, pkgs, ... }:

{
  enable = true;
  enableZshIntegration = true;
  enableFishIntegration = true;
  enableNushellIntegration = true;
  options = ["--cmd j"];
}
