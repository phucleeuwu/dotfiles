# **Dotfiles Setup**

## **Nix ❄️**

### Install & Apply

```bash
nix run github:phucleeuwu/nixos-config
```
> **Note:** For non-NixOS systems, I recommend [`Determinate Nix`](https://github.com/DeterminateSystems/nix-installer#installation).

More details: check out [my nixos-config](https://github.com/phucleeuwu/nixos-config) and [nixos-unified](https://nixos-unified.org/).

---

## **Stow 🏠**

### Install with [`Dotflow Script`](https://github.com/phucleeuwu/dotflow)

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/phucleeuwu/dotflow/main/stow.sh)"
```
