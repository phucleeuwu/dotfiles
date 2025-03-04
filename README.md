# Aesthetic and efficient dotfiles 😻.

## 📦 Install with `Nix` (or `Stow` for `.config` files only)

#### 😍 **Nix Lovers**

##### 🔧 Install Everything (Requires [`Lix` - `Nix Fork`](https://github.com/lix-project/lix))

> **Note:** Before installation, update your username in [`flake.nix`](./nix/nix-darwin/flake.nix) and [`home.nix`](./nix/nix-darwin/home.nix).

```bash
nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/dotfiles/nix/nix-darwin
```

> **Note:** After installing my dotfiles with Nix, restart your Mac to apply system-wide changes properly.

##### 🔄 Upgrade & Apply Changes

Update [`flake.lock`](./nix/nix-darwin/flake.lock):

```bash
nix flake update --flake ~/dotfiles/nix/nix-darwin
```

Rebuild with updated configurations:

```bash
darwin-rebuild switch --flake ~/dotfiles/nix/nix-darwin
```

---

#### 👍 **Stow**

##### 🛠️ Install Everything with [`Dotflow Script`](https://github.com/phucleeuwu/dotflow)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dotflow/main/i.sh)
```

---

## 🏡 Home Manager for Darwin Flake

### 🔍 Locate the [`home-manager`](https://nix-community.github.io/home-manager/index.xhtml#ch-usage) Binary

```bash
find /nix/store -name home-manager -type f | grep bin
```

### ⚙️ Apply Your Home Manager Configuration

```bash
home-manager --flake ~/dotfiles/nix/nix-darwin/ switch
```

### 📂 Managing Programs

Each program has its own `.nix` file. By default, all files inside these directories will be installed automatically, thanks to my [`script`](./nix/home-manager/default.nix):

- [`./nix/home-manager/gui`](./nix/home-manager/gui) 🖥️ GUI applications
- [`./nix/home-manager/cli`](./nix/home-manager/cli) 🛠️ CLI tools
- [`./nix/home-manager/shell`](./nix/home-manager/shell) 🐚 Shells

### ❌ Disabling Specific Programs

To prevent the installation of a specific program, set the corresponding program’s `enable` option to `false` in [`home.nix`](./nix/nix-darwin/home.nix).

---

🎉 **Enjoy your optimized system with a sleek Catppuccin Mocha theme!**
