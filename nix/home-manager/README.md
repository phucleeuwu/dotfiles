# Home manager for darwin flake

## Path to use [`home-manager`](https://nix-community.github.io/home-manager/index.xhtml#ch-usage) command for nix-darwin

```bash
find /nix/store -name home-manager -type f | grep bin
```

## Home manager rebuild

```bash
home-manager --flake ~/dotfiles/nix/nix-darwin/ switch
```
