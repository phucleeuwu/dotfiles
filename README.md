# ⚠️ Backup your `config` files

🚀 Install everything with a single command:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/Dotflow/main/i.sh)
```

🍺 Install my homebrew casks and fomulaes (Optional):

```bash
brew bundle --file=~/dotfiles/Brewfile
```

## 📂 Breakdown of the `install.sh`

	1.	Installs Homebrew (if not installed).
	2.	Clones the dotfiles repository into ~/dotfiles.
	3.	Removes existing ~/.zshrc and ~/.config to prevent conflicts.
	4.	Uses Stow to symlink dotfiles to their proper locations.
	5.	Asks if you want to remove unwanted files (e.g., .gitignore, .stowrc).
	6.	Installs Homebrew packages from Brewfile (optional).

