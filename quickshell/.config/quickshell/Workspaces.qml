import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Wayland
import Quickshell.Hyprland

Item {
    id: workspaces

    Row {
        anchors.fill: parent
        anchors.margins: 8

        Repeater {
            model: 5

            Text {
                property var workspaces: Hyprland.workspaces.values.find(w => w.id === index + 1)
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                text: index + 1
                color: isActive ? bar.colCyan : (workspaces ? bar.colBlue : bar.colMuted)

                leftPadding: index == 0 ? 5 : 60

                font {
                    pixelSize: bar.fontSize
                    bold: true
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
            }
        }
    }
}
