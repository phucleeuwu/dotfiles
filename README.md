# **Dotfiles Setup**

## **Nix ❄️**

### Install Everything

> **Note:** For non-NixOS systems, I recommend using [`Determinate Nix`](https://github.com/DeterminateSystems/nix-installer#install-nix).

```bash
nix run
```

For more details, check out [my nixos-config](https://github.com/phucleeuwu/nixos-config) and [nixos-unified](https://github.com/juspay/nixos-unified-template)

---

## **Stow 🏠**

### Install with [`Dotflow Script`](https://github.com/phucleeuwu/dotflow)

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dotflow/main/stow.sh)"
```

### Manual Installation

```bash
stow .
```

