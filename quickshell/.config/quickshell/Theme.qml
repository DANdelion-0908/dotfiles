pragma Singleton

import QtQuick

QtObject {
    readonly property color blurBg: "#55353a10"
    readonly property color bg: "#050507"
    readonly property color fg: "#2f3239"

    readonly property color muted: "#444b6a"

    readonly property color primary: "#36d5e0"
    readonly property color secondary: "#65799a"
    readonly property color tertiary: "#b89a65"
    readonly property color accent: "#f713e4"

    readonly property string fontFamily: "JetBrainsMono Nerd Font"
    readonly property int fontSize: 14

    readonly property int radius: 50
    readonly property int spacing: 10
}
