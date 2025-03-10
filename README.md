# 📦 Install with `Nix` (or `Stow`)

## **Nix**

### Install Everything (Recommend [`Lix` - `Nix Fork`](https://github.com/lix-project/lix))

> **Note:** Update your username in [`flake.nix`](./nix/darwin/flake.nix) and [`home.nix`](./nix/darwin/home.nix).

```bash
nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/dotfiles/nix/darwin
```

### Upgrade & Apply Changes

Update [`flake.lock`](./nix/darwin/flake.lock):

```bash
nix flake update --flake ~/dotfiles/nix/darwin
```

Rebuild configurations:

```bash
darwin-rebuild switch --flake ~/dotfiles/nix/darwin
```

---

## **Stow**

### Install with [`Dotflow Script`](https://github.com/phucleeuwu/dotflow)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dotflow/main/i.sh)
```

---

## 🚫 Disabling Specific Nix Module

To prevent the installation of a specific module, set the corresponding module’s `enable` option to `false` in [`home.nix`](./nix/darwin/home.nix).

---

✨ **Enjoy your optimized system with a sleek Catppuccin Mocha theme!**
