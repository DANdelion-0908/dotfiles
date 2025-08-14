[[ -f ~/.bashrc ]] && . ~/.bashrc

if uwsm check may-start; then
    exec uwsm start hyprland-uwsm.desktop
fi

hyprctl hyprpaper reload ,"$(cat ~/.cache/wal/wal)"
