{ inputs, ... }:
{
  imports = [ inputs.LazyVim.homeManagerModules.default ];

  programs.lazyvim = {
    enable = true;
  };
}
