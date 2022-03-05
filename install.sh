# packages
sudo apt install python3-pip git
sudo apt install keepassxc ranger
pip install pywal
sudo apt install adduser feh reboot bsdmainutils fdisk curl
sudo install iwpriv dhcpd wireless-tools wpasupplicant openvpn

# access, ability to use sudo
adduser rprtr258 sudo

# vim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
curl -fLo .nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget https://raw.githubusercontent.com/rprtr258/rprtr258/master/config/nvim/init.vim
sudo ln /home/rprtr258/nvim.appimage /usr/bin/vim -s

# i3
sudo apt install i3 feh imagemagick rofi networkmanager_dmenu
wget https://raw.githubusercontent.com/rprtr258/rprtr258/master/config/i3/config.txt

# polybar
sudo apt install polybar
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
git clone https://github.com/nvim-lua/plenary.nvim

# bash
echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc
# keepassxc-cli open /mnt/hdd/keepass/*.kdbx
# setxkbmap -layout us,ru -option grp:alt_shift_toggle -option ctrl:nocaps
# sudo shutdown -h now

# alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty
sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo build --release
sudo ln target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# telegram
wget https://telegram.org/dl/desktop/linux
sudo tar xJf linux -C /opt/
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop

# git
sudo apt install git
git config --global user.name "rprtr258"
git config --global user.email "poletansky@gmail.com"

# vivaldi
sudo dpkg -i vivaldi-stable_5.1.2567.49-1_amd64.deb 

