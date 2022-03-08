#ssh-add /home/rprtr258/.ssh/github 2>>/home/rprtr258/f
if [ "$(git status | wc -l)" != "4" ]; then
    cd /home/rprtr258/GTD/reference/linux_config
    git push -u cron master 2>> /home/rprtr258/f
    git status 1>> /home/rprtr258/f
    cd ../
    git add linux_config
    git commit -m "Autoupdate linux config submodule"
fi

