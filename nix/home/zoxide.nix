{ config, pkgs, ... }:

{
  enable = true;
  enableFishIntegration = true;
  enableNushellIntegration = true;
  enableZshIntegration = true;
  options = ["--cmd j"];
}
