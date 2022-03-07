pushd ~/GTD/reference/linux_config/
    # remove old
    rm -rf .config/*
    rm .{bashrc,xinitrc} crontab
    # prepare dir for nvim
    mkdir .config/nvim/
    # copy actual configs
    cp -r ~/.config/{rofi,polybar,i3}/ .config/
    cp ~/.config/nvim/init.vim .config/nvim/
    cp ~/.{bashrc,xinitrc} .
    sudo cat /var/spool/cron/crontabs/rprtr258 | rg -v '^# |^$' > crontab
popd
