title=$(xdotool getactivewindow getwindowname)
if [ "$title" != "Telegram" ]; then
    i3 kill window
else
    xdotool getactivewindow windowkill
fi
