# 🛠️ Dotfiles

Configuraciones personales para mi entorno en Linux, organizadas con symlinks usando [GNU Stow](https://www.gnu.org/software/stow/). Compatibles con [Hyprland](https://github.com/hyprwm/Hyprland), [Kitty](https://sw.kovidgoyal.net/kitty/), Bash, entre otros.

# 📁 Estructura

Cada subdirectorio corresponde a un conjunto de configuraciones y puede instalarse de forma independiente con Stow:

dotfiles
├── hypr/ → ~/.config/hypr/

├── kitty/ → ~/.config/kitty/

├── Bash/ → ~/.bashrc

├── starship/ → ~/.config/starship.toml

├── ...

## 🚀 Instalación

Clona el repositorio:

```bash
git clone https://github.com/tu_usuario/dotfiles.git
cd dotfiles

Luego aplica las configuraciones que quieras con:

stow kitty
stow zsh
stow hypr

    Asegúrate de que los archivos de destino no existan antes de aplicar stow o bien haz respaldo.

✨ Tecnologías y herramientas

    🖥️ Hyprland (WM)

    🐚 Bash + Starship

    🐱 Kitty

    🎨 Pywal para colores

    🧵 GNU Stow para symlinks

📌 Nota

Este repositorio no contiene archivos personales o sensibles. Todas las configuraciones son genéricas o adaptables.

📷 Capturas

Coming soon...
```
