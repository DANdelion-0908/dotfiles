pragma Singleton

import QtQuick

QtObject {
    readonly property color bg: "#55353a"
    readonly property color fg: "#eddbd9"

    readonly property color muted: "#444b6a"

    readonly property color primary: "#fe7773"
    readonly property color secondary: "#01bfa6"
    readonly property color tertiary: "#f9b76d"
    readonly property color accent: "#ffc838"

    readonly property string fontFamily: "JetBrainsMono Nerd Font"
    readonly property int fontSize: 14

    readonly property int radius: 50
    readonly property int spacing: 10
}
