# My Dotfiles

## 🚀 Install with Nix (or Stow for Nix haters)

### 📦 **For Nix Users**
#### Install everything (requires [lix-nix fork](https://github.com/lix-project/lix)):
```bash
nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/dotfiles/nix-darwin
```

#### ⇅ Upgrade everything:
```bash
darwin-rebuild switch --flake ~/dotfiles/nix-darwin
```

---

### 🔧 **For Nix haters**
#### 🚀 Install everything with my [dotfiles manage script](https://github.com/phucleeuwu/dotflow):
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dotflow/main/i.sh)
```

#### ⇅ Upgrade everything (requires [topgrade](https://github.com/topgrade-rs/topgrade)):
```bash
topgrade
```

---

📝 **Repo:** [phucleeuwu/dotfiles](https://github.com/phucleeuwu/dotfiles)

