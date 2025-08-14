WALLPAPER=$(cat "$HOME/.cache/wal/wal")

echo "$WALLPAPER"

# Apply the selected wallpaper
wal -i "$WALLPAPER"
hyprctl hyprpaper reload ,"$WALLPAPER"