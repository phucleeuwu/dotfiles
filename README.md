
## **❄️Nix**

### Install Everything (Recommend [`Determinate Nix`](https://github.com/DeterminateSystems/nix-installer#install-nix))

> **Note:** Update your `username` and `hostname` in [`flake.nix`](./nix/flake.nix).

```bash
nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/dotfiles/nix
```

### Rebuild & Apply Changes

```bash
darwin-rebuild switch --flake ~/dotfiles/nix
```

> **Disabling Specific Nix Module**: set the corresponding module’s `enable` option to `false` in [`home.nix`](./nix/home.nix)

## **Stow**

### Install with [`Dotflow Script`](https://github.com/phucleeuwu/dotflow)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dotflow/main/i.sh)
```




