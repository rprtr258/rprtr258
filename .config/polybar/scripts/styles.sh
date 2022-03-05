#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/polybar/scripts/rofi/colors.rasi"

BG="#1F1626"
FG="#FFFFFF"
BGA="#292030"
SEP="#473F4E"
AC="#D94084"
SE="#4F5D95"

sed -i -e "s/background = #.*/background = $BG/g" $PFILE
sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
sed -i -e "s/sep = #.*/sep = $SEP/g" $PFILE

# rofi
cat > $RFILE <<- EOF
/* colors */

* {
  al:   #00000000;
  bg:   ${BG}FF;
  bga:  ${BGA}FF;
  fg:   ${FG}FF;
  ac:   ${AC}FF;
  se:   ${SE}FF;
}
EOF

polybar-msg cmd restart

