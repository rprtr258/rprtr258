ssh-add /home/rprtr258/.ssh/github
if [ "$(gs | wc -l)" != "4" ]; then
    cd /home/rprtr258/GTD/reference/linux_config
    git push
    cd ../
    git add linux_config
    git commit -m "Autoupdate linux config submodule"
fi

