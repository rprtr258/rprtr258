ssh-add ~/.ssh/github
if [ "$(gs | wc -l)" != "4" ]; then
    cd ~/GTD/reference/linux_config
    git push
    cd ../
    git add linux_config
    git commit -m "Autoupdate linux config submodule"
fi

