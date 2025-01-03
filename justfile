#!/usr/bin/env -S just --justfile

set positional-arguments

# run task and log it
@run task:
    flock ~/cron/.errors echo {{task}} $(just {{task}} 2>&1 | paste -sd'`' -) >>~/cron/.errors

# run cmd as it was running from cron, use only for testing
@run-as-cron cmd:
    /usr/bin/env -i $(cat ~/cron/.cron-env) $@

# send logs to telegram
@monitoring:
    rwenv -i -e cmd/monitoring/.env go run cmd/monitoring/main.go

# save cron environment
@env:
    env > ~/cron/.cron-env

# TODO: connect to existing ssh-agent or start new
# commit GTD
gtd-commit:
    #!/usr/bin/env bash
    set -euo pipefail
    cd ~/GTD
    ssh-agent bash -c 'ssh-add -q ~/.ssh/github && git pull -q'
    MESSAGE=$(git status -s | awk '{print $2}' | paste -sd',')
    if [ ! -z "$MESSAGE" ]; then
        git add .
        git commit -m "$MESSAGE" -q
        #ssh-agent bash -c 'ssh-add -q ~/.ssh/github && git push -q'
    fi

# update paths db
@update-paths:
    updatedb --localpaths="/mnt/hdd/music /mnt/hdd/books /home/rprtr258"

# update rofi locate db
@update-rofi-locate:
    locate ~ /etc/ /mnt/hdd/books/ /mnt/hdd/music/ | rg -v '(^/(var|snap|usr)|/(\..*|node_modules)/)' | sed 's/\/home\/rprtr258/~/' | sed 's/\/mnt\/hdd/#/' > ~/.config/rofi/locate/db

# TODO: scan all images
# change wallpaper
wallpaper:
    #!/usr/bin/env bash
    set -euo pipefail
    export DISPLAY=:0.0
    arr[0]="saturn.jpg --geometry +0+80"
    arr[1]="morgenshtern.jpg"
    arr[2]="2b.png"
    arr[3]="polina.jpg"
    arr[4]="zyra.jpg"
    arr[5]="bunny_girl.jpg"
    arr[6]="hz.jpg"
    arr[7]="black-widow.jpg"
    arr[8]="beth.png"
    arr[9]="beth2.jpg"
    arr[10]="jinx.jpg"
    arr[11]="ahri.jpg"
    LEN=${#arr[*]}
    INDEX=$((RANDOM % LEN))
    WALLPAPERS="/home/rprtr258/pr/rprtr258/pics/desktop-wallpapers"
    feh --no-fehbg --bg-fill "$WALLPAPERS/${arr[$INDEX]}"

# TODO: fix permissions https://askubuntu.com/questions/612256/how-do-i-allow-a-user-to-only-run-the-apt-get-update-command-with-sudo
# update packages
apt-update:
    #!/usr/bin/env bash
    set -euo pipefail
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo snap refresh
    flatpak update --noninteractive >/dev/null
    go-global-update
