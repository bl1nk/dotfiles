xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/TTF
xset +fp /usr/share/fonts/artwiz-fonts-wl
xset +fp $HOME/.fonts
xset fp rehash
xset r rate 250 60
xset m 0 0

#setxkbmap us -option ctrl:nocaps,compose:menu
xkbcomp $HOME/.keymap $DISPLAY
[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
xrandr --output HDMI2 --primary --auto --left-of HDMI1
start-pulseaudio-x11

#herbstluftwm --locked
i3
