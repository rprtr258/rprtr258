pushd ~/GTD/reference/linux_config/
rm -rf .config .bashrc .xinitrc crontab
mkdir .config/
cp -r ~/.config/rofi/ .config/rofi/
cp -r ~/.config/polybar/ .config/polybar/
cp -r ~/.config/i3/ .config/i3/
mkdir .config/nvim/
cp ~/.config/nvim/init.vim .config/nvim/
cp ~/.bashrc .bashrc
cp ~/.xinitrc .xinitrc
sudo cat /var/spool/cron/crontabs/rprtr258 | rg -v '^# |^$' > crontab
popd
