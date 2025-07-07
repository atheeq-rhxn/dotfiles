## 🛠️ Overview

**Terminal & Shell:**
- **Ghostty** - Modern terminal emulator
- **Nu** - Modern shell with structured data
- **Starship** - Cross-shell prompt

**Editors:**
- **Helix** - Modal text editor
- **Zed** - Collaborative code editor

**File Management:**
- **Yazi** - Terminal file manager with plugins

**Development Tools:**
- **Zellij** - Terminal workspace manager
- **Git + JJ** - Traditional + modern version control
- **GitUI** - Terminal-based git interface
- **Zoxide** - Smart directory jumper

**Applications:**
- **Zen Browser** - Privacy-focused browser
- **Obsidian** - Knowledge management
- **Discord** - Communication platform

## 🧰 System Update & Essential Tools

**Package Manager:** `dnf` (Fedora's package manager)

```bash
sudo dnf update -y

# Enable Ghostty COPR and install
sudo dnf copr enable pgdev/ghostty -y
sudo dnf install -y ghostty

# Developer and CLI Essentials
sudo dnf install -y \
  gcc gcc-c++ make cmake perl-core openssl-devel file \
  ffmpeg p7zip jq poppler-utils fd-find ripgrep fzf \
  ImageMagick xclip wl-clipboard xsel \
  jetbrains-mono-fonts-all gtk3-devel clang ninja-build \
  git stow openssh
```

## 🧠 GNOME Configuration

**Desktop Environment:** GNOME settings via `gsettings`

```bash
# Swap Caps Lock and Escape
gsettings set org.gnome.desktop.input-sources xkb-options \
"['$(gsettings get org.gnome.desktop.input-sources xkb-options | tr -d "[]'" | sed "s/'//g")', 'caps:swapescape']"
```

## 🦀 Rust & CLI Tools

**Package Manager:** `cargo` (Rust package manager)

```bash
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install CLI tools
cargo install --locked --git https://github.com/sxyazi/yazi.git yazi-fm yazi-cli
cargo install --locked nu
cargo install --locked starship
cargo install --locked zellij
cargo install --locked gitui
cargo install --locked zoxide
cargo install --git https://github.com/astral-sh/uv uv
cargo install --locked --bin jj jj-cli
```

## 🧬 Editor & IDE Setup

**Installation Methods:** Direct install scripts and source compilation

```bash
# Helix
git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term --locked
cd ..

# Zed
curl -f https://zed.dev/install.sh | sh
```

## 🎛️ Yazi Plugins

**Plugin Manager:** `ya` (Yazi's built-in plugin manager) and `uv` (Python package installer)

```bash
uv tool install ouch
uv tool install trash-cli
ya pkg add yazi-rs/plugins:full-border
ya pkg add yazi-rs/plugins:toggle-pane
ya pkg add yazi-rs/plugins:no-status
ya pkg add yazi-rs/plugins:smart-enter
ya pkg add yazi-rs/plugins:chmod
ya pack -a TD-Sky/sudo
ya pack -a boydaihungst/restore
ya pkg add ndtoan96/ouch
```

## 📽️ Manim Dependencies

**Package Manager:** `dnf` for system libraries

```bash
sudo dnf install -y python3-devel pkg-config cairo-devel pango-devel
sudo dnf install -y texlive-scheme-full
```

## 🧾 Git & JJ Configuration

**Version Control:** Git and JJ (Jujutsu) configuration

```bash
git config --global user.email "atheeq.rhxn@gmail.com"
git config --global user.name "atheeq-rhxn"
jj config set --user user.name "atheeq-rhxn"
jj config set --user user.email "atheeq.rhxn@gmail.com"

# Git & JJ integration:
jj git init --colocate
```

## 📦 Flatpak Applications

**Package Manager:** `flatpak` (Universal Linux packages)

```bash
flatpak install -y flathub \
  ca.desrt.dconf-editor \
  app.zen_browser.zen \
  com.discordapp.Discord \
  md.obsidian.Obsidian
```

## 🏠 Dotfiles Setup

```bash
git clone git@github.com:atheeq-rhxn/dotfiles.git
cd dotfiles
stow -t ~/.config config
stow -t ~ home
```

## 🔑 SSH Key Setup

**SSH Key Generation:** `ssh-keygen` with Ed25519 algorithm

```bash
echo "Generating SSH key..."
ssh-keygen -t ed25519 -C "atheeq.rhxn@gmail.com"
# Start SSH agent
echo "Starting SSH agent..."
eval "$(ssh-agent -s)"
# Add SSH key to agent
echo "Adding SSH key to agent..."
ssh-add ~/.ssh/id_ed25519
# Copy public key to clipboard
echo "Copying public key to clipboard..."
xclip -sel clip < ~/.ssh/id_ed25519.pub
```
