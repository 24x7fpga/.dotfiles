#!/usr/bin/env bash 

COLORSCHEME=Dracula

### FIX EMACS ELPACA SYMLINKS ###
# This runs the fix-elpaca-symlinks scripts which 
# fixes all of the symlinks in .config/emacs/elpaca/build.
# This is needed as part of DTOS and is only run ONCE!
# if [[ -f "$HOME/.config/fix-elpaca-symlinks/log" ]]; then
#     echo "fix-eplaca-symlinks has been run previously."
# else
#     /usr/local/bin/fix-elpaca-symlinks
#     touch "$HOME/.config/fix-elpaca-symlinks/log" 
#     echo "has-been-run: TRUE" > "$HOME/.config/fix-elpaca-symlinks/log" 
# fi

### AUTOSTART PROGRAMS ###
lxsession &
picom --daemon &
/usr/bin/emacs --daemon &
nm-applet &
#"$HOME"/.screenlayout/layout.sh &

### UNCOMMENT ONLY ONE OF THE FOLLOWING THREE OPTIONS! ###
# 1. Uncomment to restore last saved wallpaper
# xargs xwallpaper --stretch < ~/.cache/wall &
# 2. Uncomment to set a random wallpaper on login
# find $HOME/Pictures/Wallpapers/ -type f | shuf -n 1 | xargs xwallpaper --fill &
# 3. Uncomment to set wallpaper with nitrogen
nitrogen --restore &

### SETS CONKY STYLE BASED ON SCREEN RESOLUTION
# Checks screen resolution.  If 1080p or higher, then we use '01' conky.
# If less than 1080p (laptops?), then we use the smaller '02' conky.
# You can also set these to values '03' and '04' if you want a fancier
# conky that displays lua rings and sensor information.
# resolutionHeight=$(xrandr | grep "primary" | awk '{print $4}' | awk -F "+" '{print $1}' | awk -F 'x' '{print $2}')

# if [[ $resolutionHeight -ge 1080 ]]; then
#     killall conky || echo "Conky not running."
#     sleep 2
#     conky -c "$HOME"/.config/conky/qtile/01/"$COLORSCHEME".conf || echo "Couldn't start conky."
# elif [[ $resolutionHeight -lt 1080 ]]; then
#     killall conky || echo "Conky not running."
#     sleep 2
#     conky -c "$HOME"/.config/conky/qtile/02/"$COLORSCHEME".conf || echo "Couldn't start conky."
# else
#     killall conky || echo "Conky not running."
#     sleep 2
#     conky -c "$HOME"/.config/conky/qtile/02/"$COLORSCHEME".conf || echo "Couldn't start conky."
# fi

# Launch Polybar
#$HOME/.config/polybar/launch.sh &
