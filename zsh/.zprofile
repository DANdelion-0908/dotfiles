[[ -f ~/.bashrc ]] && . ~/.bashrc

if uwsm check may-start; then
    exec uwsm start hyprland-uwsm.desktop
fi

exec $HOME/.config/hypr/set_wallpaper.sh
