# run with sudo

## install packages
sudo apt install ripgrep i3 keepassxc polybar cargo rofi polybar curl htop pragha xsel flameshot python3-pip git keepassxc ranger adduser reboot bsdmainutils fdisk curl

## access, ability to use sudo
adduser rprtr258 sudo

## neovim
sudo ln /usr/local/bin/nvim /usr/local/bin/vim -s
# TODO: instead build and install from source
#curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
curl -fLo .nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget https://raw.githubusercontent.com/rprtr258/rprtr258/master/config/nvim/init.vim
ln /home/rprtr258/nvim.appimage /usr/bin/vim -s
# apt install nvim # TODO: replace with downloading and linking
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim —create-dirs \
# https://raw.githubusercontent.com/junegunn/vim-plug/m..'
# :PlugInstall # TODO: from command line
# TODO: :checkhealth

## i3
apt install i3 feh imagemagick rofi networkmanager_dmenu
wget https://raw.githubusercontent.com/rprtr258/rprtr258/master/config/i3/config.txt

## install fonts for polybar
FONTS_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONTS_DIR"
git clone https://github.com/adi1090x/polybar-themes/
cp -rf polybar-themes/fonts/* "$FONTS_DIR"
rm -rf polybar-themes

## polybar
apt install polybar
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
git clone https://github.com/nvim-lua/plenary.nvim

## bash
echo 'set completion-ignore-case On' | tee -a /etc/inputrc
# keepassxc-cli open /mnt/hdd/keepass/*.kdbx
# setxkbmap -layout us,ru -option grp:alt_shift_toggle -option ctrl:nocaps
# shutdown -h now
# cp /mnt/hdd/GTD/reference/linux_config/.bashrc ~/.bashrc
# echo 'set completion-ignore-case On' | tee -a /etc/inputrc

## alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty
apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 # g++
# cargo install alacritty
cargo build --release
ln target/release/alacritty /usr/local/bin
cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
desktop-file-install extra/linux/Alacritty.desktop
update-desktop-database

## telegram
apt install snap
snap install telegram-desktop

## git
apt install git
git config --global user.name "rprtr258"
git config --global user.email "poletansky@gmail.com"
git config --global pull.rebase false

## obs
flatpak install flathub com.obsproject.Studio

## code
wget https://go.microsoft.com/fwlink/?LinkID=760868
mv index.html\?LinkID\=760868 code.deb
apt install code.deb
rm code.deb

## go
wget https://go.dev/dl/go1.18.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz
rm go1.18.linux-amd64.tar.gz

## difftastic
### install cargo
rustup update
cargo install difftastic

## unsorted

