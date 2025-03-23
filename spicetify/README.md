# Spicetify Config

A minimalist and beautiful Spicetify setup with fullscreen mode and lyrics support.

## Screenshots

![Spicetify Setup](https://raw.githubusercontent.com/phucleeuwu/spicetify-config/refs/heads/main/Screenshot%202025-02-04%20at%2014.20.19.png)
![Spicetify Setup](https://raw.githubusercontent.com/phucleeuwu/spicetify-config/refs/heads/main/Screenshot%202025-02-04%20at%2014.25.40.png)
![Spicetify Setup](https://raw.githubusercontent.com/phucleeuwu/spicetify-config/refs/heads/main/Screenshot%202025-02-04%20at%2014.26.34.png)
![Spicetify Setup](https://raw.githubusercontent.com/phucleeuwu/spicetify-config/refs/heads/main/Screenshot%202025-02-04%20at%2014.32.18.png)

## Installation

Install Spicetify and Marketplace:

```bash
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
```

1. Install **Spotify Backup by Ohitstom** from the **Marketplace**.
2. Reload Spotify.
3. Go to **Marketplace settings > Backup/Restore**.
4. Import `spotify-backup.json`.

## Features

- **Fullscreen Mode** (`f` to toggle, `x` to config, `q` for queue, `l` for lyrics)
- **Minimal & Clean UI**
- **Adblock for Free Users**
- **Lyrics Display**:

  ```sh
  spicetify config custom_apps lyrics-plus
  spicetify apply
  ```

## Apply & Update

```bash
spicetify update && spicetify backup apply
```

## Notes

- Ensure Spicetify is installed before applying.
- If issues arise, try `spicetify backup apply`.

## Credits

- [Spicetify](https://github.com/spicetify/spicetify-cli)
- [Fullscreen Extension](https://github.com/daksh2k)
- [Spotify Backup](https://github.com/ohitstom)

🎧 Enjoy your enhanced Spotify experience!
