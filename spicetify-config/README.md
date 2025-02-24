# Spicetify Config

This repository contains my personalized Spicetify backup configuration, featuring a minimalist and beautiful setup. It includes a fullscreen extension and support for lyrics display.
## Screenshot

![Spicetify Setup](https://raw.githubusercontent.com/phucleeuwu/spicetify-config/refs/heads/main/Screenshot%202025-02-04%20at%2014.20.19.png)
![Spicetify Setup](https://raw.githubusercontent.com/phucleeuwu/spicetify-config/refs/heads/main/Screenshot%202025-02-04%20at%2014.25.40.png)
![Spicetify Setup](https://raw.githubusercontent.com/phucleeuwu/spicetify-config/refs/heads/main/Screenshot%202025-02-04%20at%2014.26.34.png)
![Spicetify Setup](https://raw.githubusercontent.com/phucleeuwu/spicetify-config/refs/heads/main/Screenshot%202025-02-04%20at%2014.32.18.png)

## Installation

Install spicetify and marketplace command:

```bash
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
```

1. Install **Spotify Backup by Ohitstom** from the **Marketplace**.
2. Reload the Spotify app.
3. Open **Marketplace settings** and navigate to **Backup/Restore**.
4. Import `spotify-backup.json`.
5. You're all set!

## ⚠️My spicetify config only beautiful if you play a song and press `F` toggle fullscreen mode.

## Features & Usage

- **Fullscreen Mode**: I have pre-configured the **Fullscreen Extension by daksh2k**. Simply press `f` to toggle fullscreen mode on and off, `x` to config,`q` show queue, `l` toggle lyrics.
- **Minimalist & Beautiful UI**: The configuration is designed to be clean and visually appealing.
- **Includes `adblock` for "freemium" users**.
- **Lyrics Display**: To enable lyrics, install the `lyrics-plus` custom app using the following command:

  ```sh
  spicetify config custom_apps lyrics-plus
  spicetify apply
  ```

Enjoy your enhanced Spotify experience! 🎵

## Update and apply

```bash
spicetify update && spicetify backup apply
```

## Notes

- Ensure Spicetify is installed and set up correctly before applying this backup.
- If you encounter any issues, try running `spicetify backup apply` after importing the configuration.

---

### Credits

- **Spicetify**: [GitHub](https://github.com/spicetify/spicetify-cli)
- **Fullscreen Extension**: [daksh2k](https://github.com/daksh2k)
- **Spotify Backup**: [Ohitstom](https://github.com/ohitstom)

Feel free to modify this backup to suit your needs. Happy listening! 🎧
