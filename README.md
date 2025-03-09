# 📦 Install with `Nix` (or `Stow`)

## **Nix**

### Install Everything (Requires [`Lix` - `Nix Fork`](https://github.com/lix-project/lix))

> **Note:** Before installation, update your username in [`flake.nix`](./nix/nix-darwin/flake.nix) and [`home.nix`](./nix/nix-darwin/home.nix).

```bash
nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/dotfiles/nix/darwin
```

> **Note:** After installing my dotfiles with Nix, restart your Mac to properly apply system-wide changes.

### Upgrade & Apply Changes

Update [`flake.lock`](./nix/nix-darwin/flake.lock):

```bash
nix flake update --flake ~/dotfiles/nix/darwin
```

Rebuild with updated configurations:

```bash
darwin-rebuild switch --flake ~/dotfiles/nix/darwin
```

---

## **Stow**

### Install Everything with [`Dotflow Script`](https://github.com/phucleeuwu/dotflow)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dotflow/main/i.sh)
```

---

## 🚫 Disabling Specific Programs

To prevent the installation of a specific program, set the corresponding program’s `enable` option to `false` in [`home.nix`](./nix/nix-darwin/home.nix).

---

✨ **Enjoy your optimized system with a sleek Catppuccin Mocha theme!**
