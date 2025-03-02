# My Dotfiles

## Install with Nix (or Stow for Nix Haters)

### 😍 **For Nix Lovers**

#### Install everything (requires [`Lix` - `Nix fork`](https://github.com/lix-project/lix))

> **Note:** Check [`flakes.nix`](./nix/nix-darwin/flakes.nix) username before install

```bash
nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/dotfiles/nix/nix-darwin
```

#### ⇅ Upgrade everything

```bash
darwin-rebuild switch --flake ~/dotfiles/nix/nix-darwin
```

> **Note:** After installing your dotfiles with Nix, you should restart your Mac to apply system-wide changes properly.

---

### 😡 **For Nix Haters**

#### Install everything with my [`Dotfiles Script`](https://github.com/phucleeuwu/dotflow)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dotflow/main/i.sh)
```

#### ⇅ Upgrade everything (requires [`Topgrade`](https://github.com/topgrade-rs/topgrade))

```bash
topgrade
```
