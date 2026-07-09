-----------------------------------------------------------------------------------------
--  __  __     __  __     ______   ______     __         ______     __   __     _____
-- /\ \_\ \   /\ \_\ \   /\  == \\ /\  == \\   /\ \       /\  __ \   /\ "-.\ \   /\  __-.
-- \ \  __ \  \ \____ \  \ \  _-/ \ \  __<   \ \ \____  \ \  __ \  \ \ \-.  \  \ \ \// \
--  \ \_\ \_\  \/\_____\  \ \_\    \ \_\ \_\  \ \_____\  \ \_\ \_\  \ \_\"\_\  \ \____-
--   \/_/\/_/   \/_____/   \/_/     \/_/ /_/   \/_____/   \/_/\/_/   \/_/ \/_/   \/____/
--
-- by Daniel Penedo (Dandelion)
-----------------------------------------------------------------------------------------

----------------
--- MONITORS ---
----------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Syntax ->  monitor = output, mode, position, scale.

-- Laptop monitor: eDP-1
hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = "1",
})

-- PC Monitor
hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@120",
    position = "0x0",
    scale = "1",
})

-- Random Monitors
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})


-------------------
--- MY PROGRAMS ---
-------------------

-- Syntax -> local (optional but recommended) keyword = value

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "$HOME/.config/rofi/launchers/type-4/launcher.sh"
local browser = "zen-browser"
local editor = "code"

local ipc = "noctalia msg"

-----------------
--- AUTOSTART ---
-----------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Expanding-functionality/#events

-- Startup
hl.on("hyprland.start", function()
    -- My Apps
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("discord --start-minimized & steam -silent")

    -- System Apps and Sercvices
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("hyprctl setcursor Qogir-Dark 24")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("systemctl --user enable hyprpolkitagent")
    hl.exec_cmd("clipse -listen")
    hl.exec_cmd("thunderbird")
    hl.exec_cmd("source $HOME/.config/hypr/env-vars.sh")
end)

-- Shutdown
hl.on("hyprland.shutdown", function()
    hl.exec_cmd("hyprshutdown")
end)

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Wayland DRM Devices
hl.env("WLR_DRM_DEVICES", "/dev/dri/card1")

-- Hyprcursor
hl.env("HYPRCURSOR_THEME", "Qogir-Dark")
hl.env("HYPRCURSOR_SIZE", "24")

-- XCursor
hl.env("XCURSOR_THEME", "Qogir-Dark")
hl.env("XCURSOR_SIZE", "24")

-- Qt
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

-- Nvidia
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Unscale XWayland
-- xwayland {
--     force_zero_scaling = true
-- }

-------------------------------
--- Clipboard Configuration ---
-------------------------------

hl.window_rule({
    name = "clipse_window_format",
    match = {
        class = "clipse",
    },
    size = "622 622",
    float = true,
    stay_focused = true,
})

---------------------
--- LOOK AND FEEL ---
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Variables/
-- Syntax -> hl.config({category = {value = {}}})

-- Window Decorations
hl.config({
    general = {
        border_size = 3,

        gaps_in = 5,
        gaps_out = 10,

        col = {
            active_border = { colors = { "rgba(2ECCD0aa)", "rgba(F811E4aa)" }, angle = 90 },
            inactive_border = "rgba(000000aa)",
        },

        resize_on_border = true,

        allow_tearing = true,

        layout = "dwindle",
    },

    decoration = {
        rounding = 3,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.95,

        blur = {
            enabled = true,
            size = 10,
            passes = 3,
            ignore_opacity = true,
            xray = false,
            noise = 0.0117,
            contrast = 1,
            brightness = 2.0,
            vibrancy = 0.1696,
            vibrancy_darkness = 0.0,
            special = true,
            popups = false,
            popups_ignorealpha = 0.2,
            input_methods = false,
            input_methods_ignorealpha = 0.2
        },

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(000000ee)",
            color_inactive = "rgba(1a1a1aee)",
            offset = { 0, 0 },
            scale = 1.0,
        },

        glow = {
            enabled = true,
            range = 15,
            render_power = 3,
            color = "rgba(000000aa)",
        }
    },

    animations = {
        enabled = true,
        workspace_wraparound = true
    }
})

------------------
--- Animations ---
------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- Animation Syntax -> hl.animation({ leaf = STRING, enabled = BOOLEAN, speed = FLOAT, curve = STRING[, style = STRING] })
-- Bezier Syntax -> hl.curve( NAME, { type = "spring", mass = MASS, stiffness = STIFF, dampening = DAMP })

-- Bezier Curves
hl.curve("rubber", { type = "spring", mass = 1, stiffness = 70, dampening = 10 })

-- Animations
hl.animation({ leaf = "windows", enabled = true, speed = 1, spring = "rubber", style = "slide" })

---------------
--- Layouts ---
---------------

-- dwindle
hl.config({
    dwindle = {
        force_split = 0,
        preserve_split = true,
        smart_split = true,
        smart_resizing = true,
        permanent_direction_override = false,
        special_scale_factor = 1,
        use_active_for_splits = true,
        default_split_ratio = 1.0,
        split_bias = 1,
        precise_mouse_move = true
    }
})

-- Master
hl.config({
    master = {
        allow_small_split = true,
        special_scale_factor = 1,
        mfact = 0.3,
        new_status = "master",
        new_on_top = true,
        new_on_active = "after",
        orientation = "left",
        slave_count_for_center_master = 2,
        center_master_fallback = "left",
        smart_resizing = true,
        drop_at_cursor = true,
        always_keep_position = false
    }
})

-------------
--- INPUT ---
-------------

-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
    input = {
        kb_model = "",
        kb_layout = "latam",

        numlock_by_default = true,

        sensitivity = 0,
        accel_profile = "flat",
        rotation = 0,
        scroll_button = 0,

        follow_mouse = 1,

        touchpad = {
            natural_scroll = true,
        }
    }
})

-------------------
--- KEYBINDINGS ---
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/

-- Apps binds
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + D", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind("Print",
    hl.dsp.exec_cmd('grim - | satty -f - --copy-command wl-copy -o "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png"'))
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind("SUPER + V", hl.dsp.exec_cmd('kitty --class clipse -e clipse'))

-- Open config file
hl.bind("SUPER + I", hl.dsp.exec_cmd("code $HOME/dotfiles/"))

-- Swap Windows
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "right" }))
hl.bind("SUPER + SHIFT + LEFT", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + SHIFT + UP", hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + SHIFT + DOWN", hl.dsp.window.swap({ direction = "down" }))

-- Move Windows
hl.bind("SUPER + P", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + O", hl.dsp.window.move({ direction = "left" }))

-- Move Focus
hl.bind("SUPER + UP", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + DOWN", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "right" }))

-- System binds
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle", window = "active" }))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + E", hl.dsp.exit())
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + X", hl.dsp.window.float())
hl.bind("SUPER + W", hl.dsp.exec_cmd("quickshell"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("pkill quickshell"))

-- Switch Workspaces
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Special Workspace
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("special"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special" }))


-- Mouse Binds
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Brightness Control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"))

-- Volume Control
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))

-- Player Control
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

------------------
--- Workspaces ---
------------------

hl.workspace_rule({ workspace = "1", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1", persistent = true })

--------------------
--- WINDOW RULES ---
--------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Ignore maximize requests from apps
hl.window_rule({
    name = "maximize_request_from_apps",
    match = { class = "*" },
    suppress_event = "maximize"
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix_dragging_issues",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = true,
        pin = true
    },
    no_focus = true
})

-- Thunderbird rules
hl.window_rule({
    name = "thunderbird_workspace",
    match = { class = "org.mozilla.Thunderbird" },
    workspace = 5,
    no_initial_focus = true
})

-- Picture-in-Picture
hl.window_rule({
    name = "picture_in_picture",
    match = { title = "Picture-in-Picture" },
    float = true,
    size = { "cursor_x-(window_w*0.5))", "(cursor_y-(window_h*0.5))" },
    pin = true,
    no_initial_focus = true
})

-- Noctalia rules
hl.window_rule({
    match = {  class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

-------------------
--- LAYER RULES ---
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/#layer-rules

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

hl.layer_rule({
    name = "blur swaync (to remove)",
    match = { namespace = "swaync-control-center" },
    blur = false
})

hl.layer_rule({
    name = "blur selection",
    match = { namespace = "selection" },
    blur = false
})

hl.layer_rule({
    name = "blur browser",
    match = { namespace = "$browser" },
    blur = true
})
