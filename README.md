## ⚠️ Backup `.zshrc` and `.config` first

🚀 Install everything with a single command:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dot.manager/main/o.sh)
```

🍺 Install my homebrew casks and fomulaes (Optional):

```bash
brew bundle --file=~/dotfiles/Brewfile
```

### 📂 Breakdown of the `install.sh`

1. Clone the dotfiles repository.
2. Sync the configuration files to `~/.config/` using `stow`.
3. Remove all unnecessary files
