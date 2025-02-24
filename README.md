# ⚠️ Back up your `.config` files

🚀 Install everything with a single command:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/Dotflow/main/i.sh)
```

⇅ Upgrade everything (requires [`topgrade`](https://github.com/topgrade-rs/topgrade):

```bash
topgrade
```

## 📂 Breakdown of the `i.sh`

1. Installs [Homebrew](https://brew.sh/) 🍺 (if not installed).
2. Clones the dotfiles repository into `~/dotfiles`.
3. Removes existing `~/.zshrc` and `~/.config` to prevent conflicts.
4. Uses `Stow` to symlink `~/dotfiles` to `~/.config`.
6. Installs [Homebrew](https://brew.sh/) 🍺 packages from [My Brewfile](/Brewfile) (optional).
