# My Dotfiles

[![GitHub repo](https://img.shields.io/badge/GitHub-Repo-blue?logo=github)](https://github.com/phucleeuwu/dotfiles)

## Install with Nix (or Stow for Nix Haters)

### 😍 **For Nix Lovers**

#### Install everything (requires [`Lix` - `Nix fork`](https://github.com/lix-project/lix))

> **Note:** Before installation, update your username in [`flake.nix`](./nix/nix-darwin/flake.nix) and [`home.nix`](./nix/nix-darwin/home.nix).

```bash
nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/dotfiles/nix/nix-darwin
```

#### ⇅ Upgrade everything

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

### 😡 **For Nix Haters**

#### Install everything with my [`Dotfiles Script`](https://github.com/phucleeuwu/dotflow)

> This script will link `raycast` and `github-copilot` from `~/Documents/Personal/*` unless you choose to delete unnecessary files. These folders are stored there for convenience as Finder backs them up to iCloud.

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dotflow/main/i.sh)
```

#### ⇅ Upgrade everything (requires [`Topgrade`](https://github.com/topgrade-rs/topgrade))

```bash
topgrade
```

---

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
