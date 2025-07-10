# 🛠️ Dotfiles

Configuraciones personales para mi entorno en Linux, organizadas con symlinks usando [GNU Stow](https://www.gnu.org/software/stow/).



## ✔ Compatibles con:

- [Hyprland](https://github.com/hyprwm/Hyprland)
- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [Bash](https://www.gnu.org/software/bash/)
- [Waybar](https://github.com/Alexays/Waybar.git)
- [Swaync](https://github.com/ErikReider/SwayNotificationCenter)
- [Rofi Wayland](https://github.com/in0ni/rofi-wayland)
- [Thunar](https://docs.xfce.org/xfce/thunar/start)
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Krabby](https://github.com/yannjor/krabby)
- [Starship](https://starship.rs/)

## 📁 Estructura

Cada subdirectorio corresponde a un conjunto de configuraciones y puede instalarse de forma independiente con Stow:

```
dotfiles

├── hypr/ → ~/.config/hypr/

├── kitty/ → ~/.config/kitty/

├── Bash/ → ~/.bashrc

├── starship/ → ~/.config/starship.toml

├── ...
```

## 🚀 Instalación

1. Clona el repositorio:

```bash
git clone https://github.com/tu_usuario/dotfiles.git
cd dotfiles
```

2. Ejecuta el archivo `install.sh` para instalar todos los paquetes necesarios.

>[!NOTE]
>Puedes ver los paquetes a instalar en el archivo `packages.txt`.

```bash
./install.sh
```

Luego aplica las configuraciones que quieras con:

```bash
stow kitty
stow waybar
stow hypr
...
```

>[!WARNING]
>Asegúrate de que los archivos de destino no existan antes de aplicar stow o bien haz respaldo.

📷 Capturas

Coming soon...
