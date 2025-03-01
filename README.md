# Install my dotfiles with nix and nix-darwin

🛠️ Link my `dotfiles`:

```bash
stow .
stow git zsh -t ~
```

🚀 Install everything (requires [lix-nix fork](https://github.com/lix-project/lix)):

```bash
nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/dotfiles/nix-darwin
```

⇅ Upgrade everything :

```bash
darwin-rebuild switch --flake ~/dotfiles/nix-darwin
```
