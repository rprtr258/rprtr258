pushd ~/GTD/reference/linux_config/
    # remove old
    rm -rf .config/*
    rm .{bashrc,xinitrc} crontab

    # prepare dir for nvim
    mkdir .config/nvim/

    # copy actual configs
    cp -r ~/.config/{rofi,polybar,i3,alacritty}/ .config/
    cp -r ~/.config/mimeapps.list .config/
    cp ~/.config/nvim/init.vim .config/nvim/
    cp ~/.{bashrc,xinitrc,bash_colors} .
    sudo crontab -l | rg -v '^# |^$' > crontab
popd
