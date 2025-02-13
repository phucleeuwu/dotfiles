## ⚠️ Backup `.zshrc` and `.config` first

🚀 Install everything with a single command:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dot.manager/main/o.sh)
```

🍺 Install my homebrew casks and fomulaes (Optional):

```bash
brew bundle --file=~/dotfiles/Brewfile
```

### 🔒 Personal use only

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dot.manager/main/o.sh) -i
```

### Breakdown of the `install.sh`

1. Clone the dotfiles repository.
2. Sync the configuration files to `~/.config/` using `stow`.
3. Remove all unnecessary files

## 📂 Contents

This repository includes configurations for:

- **Aerospace** 🚀 – My favourite tiling window manager for macOS.
- **Zsh** 🐚 – Custom `.zshrc` file for the Zsh shell.
- **Neovim** 📝 – Configuration files for the Neovim editor.
- **Tmux** 🖥️ – Settings for the Tmux terminal multiplexer.
- **Starship** 🌟 – Configuration for the Starship prompt.
- **Lazygit** 🗂️ – Settings for the Lazygit interface.
- **Helix** 🧠 – Configuration for the Helix editor.
- **Atuin** 🐢 – Settings for the Atuin shell history manager.
- **Fastfetch** ⚡ – Configuration for the Fastfetch system information tool.
- **Spicetify** 🎶 – Customizations for the Spicetify Spotify client.
- **qBittorrent** 📥 – Configuration for the qBittorrent client.
- **The Fuck** 💥 – Configuration for The Fuck command-line tool.
- **Yazi** 📂 – Settings for the Yazi file manager.
- **Zed** 🧑‍💻 – Configuration for the Zed code editor.
- **Bat** 🦇 – Settings for the Bat command-line tool.
- **Ghostty** 👻 – Configuration for the Ghostty terminal.
- **Karabiner Elements** ⌨️ – Settings for many useful keyboard modifications like `capslock` as `␛` and `⌃` at the same time.
