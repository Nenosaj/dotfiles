# 󰙄 Nenosaj's Dotfiles

A curated collection of my personal configuration files for a tiling window manager setup with a focus on performance, aesthetics, and keyboard-driven workflows.

> "probably finished" — famous last words 😎

---

##  Includes Configs for:

| Tool       | Purpose                        |
|------------|--------------------------------|
| `i3`       | Tiling window manager          |
| `picom`    | Window compositor (for transparency, blur, etc.) |
| `polybar`  | Custom status bar              |
| `rofi`     | Launcher and window switcher   |
| `kitty`    | GPU-based terminal emulator    |
| `zellij`   | Terminal workspace manager     |
| `nvim`     | Neovim config (Lua)            |
| `ncmpcpp`  | Music player client (MPD)      |
| `mpd`      | Music daemon                   |
| `mpv`      | Media player config            |
| `fastfetch`| System info in terminal        |
| `yazi`     | Terminal file manager          |
| `scripts/` | Helper scripts and utilities   |
| `.zshrc`   | Zsh shell config               |

polybar theme -> https://github.com/adi1090x/polybar-themes

---

##  Setup Instructions

### 1. Clone the Repo

```bash
git clone https://github.com/Nenosaj/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Link Config Files (Manual Example)

```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/i3 ~/.config/i3
# Repeat as needed
```

> Or use your own method like GNU Stow, `chezmoi`, or a setup script.

---

##  Tested On

- ✅ Arch Linux
- ⚠️ Other distros not tested yet

---

##  Notes

- Uses Lua-based Neovim config
- Polybar and Rofi are themed to match using pywal
- Fastfetch replaces neofetch for system info
- Scripts directory includes personal utilities

---

##  License

MIT — Free to use, copy, and break 😄

---

## 󱞁 Personal To-Do

- [ ] Add full install script
- [ ] Back up personal `~/.local` binaries
- [ ] Document dependencies per tool 🗂️ Nenosaj's Dotfiles


