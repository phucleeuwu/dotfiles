# Home Manager for Darwin Flake

## Path to Use [`home-manager`](https://nix-community.github.io/home-manager/index.xhtml#ch-usage) Command for Nix-Darwin

To locate the `home-manager` binary within the Nix store, run:

```bash
find /nix/store -name home-manager -type f | grep bin
```

## Home Manager Rebuild

To apply your Home Manager configuration, run:

```bash
home-manager --flake ~/dotfiles/nix/nix-darwin/ switch
```

## Managing Installed Programs

Each program has its own `.nix` file. By default, all `.nix` files inside this directories will be installed thanks to my [`script`](./nix/home-manager/default.nix):

- [`./nix/home-manager/gui`](./nix/home-manager/gui)
- [`./nix/home-manager/cli`](./nix/home-manager/cli)
- [`./nix/home-manager/shell`](./nix/home-manager/shell)

### Disabling Specific Programs

To disable specific programs, edit [`./nix/nix-darwin/home.nix`](./nix/nix-darwin/home.nix) and set the corresponding program’s `enable` option to `false`.

## Repository

🔗 [GitHub Repository](https://github.com/phucleeuwu/dotfiles)
