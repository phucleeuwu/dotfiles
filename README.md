# My Dotfiles with 🙀Catppuccin Mocha as default theme

## Install with Nix (or Stow for those who only need `.config` files)

### 😍 **Nix Lovers**

#### Install everything (requires [`Lix` - `Nix fork`](https://github.com/lix-project/lix))

> **Note:** Before installation, update your username in [`flake.nix`](./nix/nix-darwin/flake.nix) and [`home.nix`](./nix/nix-darwin/home.nix).

```bash
nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/dotfiles/nix/nix-darwin
```

#### ⇅ Upgrade and apply changes

> Update `flake.lock`:

```bash
nix flake update --flake ~/dotfiles/nix/nix-darwin
```

> Rebuild with updated configurations:

```bash
darwin-rebuild switch --flake ~/dotfiles/nix/nix-darwin
```

> **Note:** After installing my dotfiles with Nix, restart your Mac to apply system-wide changes properly.

---

### 😡 **Nix Haters**

#### Install everything with my [`Dotfiles Script`](https://github.com/phucleeuwu/dotflow)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dotflow/main/i.sh)
```

#### ⇅ Upgrade everything (requires [`Topgrade`](https://github.com/topgrade-rs/topgrade))

```bash
topgrade
```

---

# Home Manager for Darwin Flake

## To locate the [`home-manager`](https://nix-community.github.io/home-manager/index.xhtml#ch-usage) binary run

```bash
find /nix/store -name home-manager -type f | grep bin
```

## To apply your Home Manager configuration, run

```bash
home-manager --flake ~/dotfiles/nix/nix-darwin/ switch
```

## Managing Programs

Each program has its own `.nix` file. By default, all files inside this directories will be installed thanks to my [`script`](./nix/home-manager/default.nix):

- [`./nix/home-manager/gui`](./nix/home-manager/gui)
- [`./nix/home-manager/cli`](./nix/home-manager/cli)
- [`./nix/home-manager/shell`](./nix/home-manager/shell)

### Disabling Specific Programs

To not install a specific programs, set the corresponding program’s `enable` option to `false` in [`./nix/nix-darwin/home.nix`](./nix/nix-darwin/home.nix)
