sudo dnf update -y
gsettings set org.gnome.desktop.input-sources xkb-options "['$(gsettings get org.gnome.desktop.input-sources xkb-options | tr -d "[]'" | sed "s/'//g")', 'caps:swapescape']"
flatpak install flathub app.zen_browser.zen
sudo dnf copr enable pgdev/ghostty
sudo dnf install -y ghostty
sudo dnf install -y   gcc   gcc-c++   make   cmake   perl-core   openssl-devel   file   ffmpeg   p7zip   jq   poppler-utils   fd-find   ripgrep   fzf   ImageMagick   xclip   wl-clipboard   xsel   jetbrains-mono-fonts-all   gtk3-devel   clang   ninja-build   git   stow   openssh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install xremap --features gnome
cargo install --locked --git https://github.com/sxyazi/yazi.git yazi-fm yazi-cli
cargo install nu --locked
cargo install starship --locked
cargo install --locked zellij
cargo install zoxide --locked
git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term --locked
ln -Ts $PWD/runtime ~/.config/helix/runtime


