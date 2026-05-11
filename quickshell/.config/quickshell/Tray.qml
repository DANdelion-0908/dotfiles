import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Services.SystemTray

Item {
    Row {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 10

        Repeater {
            model: SystemTray.items

            Image {
                source: modelData.icon
                sourceSize: Qt.size(16, 16)
            }
        }

    }
}
