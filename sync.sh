pushd ~/GTD/reference/linux_config/
rm -rf .{config,bashrc,xinitrc} crontab
mkdir .config/
cp -r ~/.config/{rofi,polybar,i3}/ .config/
mkdir .config/nvim/
cp ~/.config/nvim/init.vim .config/nvim/
cp ~/.{bashrc,xinitrc} .
sudo cat /var/spool/cron/crontabs/rprtr258 | rg -v '^# |^$' > crontab
popd
