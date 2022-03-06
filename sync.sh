pushd ~/GTD/reference/linux_config/
cp -r ~/.config/rofi/* .config/rofi/
cp ~/.config/polybar/* .config/polybar/
cp ~/.config/i3/* .config/i3/
cp ~/.config/nvim/init.vim .config/nvim/
cp ~/.bashrc .bashrc
sudo cat /var/spool/cron/crontabs/rprtr258 | rg -v '^# ' > crontab
popd
