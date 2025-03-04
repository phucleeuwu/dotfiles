# Home manager for darwin flake

## Path to use `home manager` command for nix-darwin

```bash
find /nix/store -name home-manager -type f | grep bin
```
## Home manager rebuild

```bash
home-manager --flake ~/dotfiles/nix/nix-darwin/ switch
```

