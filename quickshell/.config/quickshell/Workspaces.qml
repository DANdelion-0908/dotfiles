import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Layouts
import Quickshell.Wayland
import Quickshell.Hyprland

Item {
    id: workspaces

    Row {
        spacing: 10

        Repeater {
            model: 5

            Rectangle {
                id: workspaceButton
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

                width: 40
                height: 30
                radius: 50

                color: isActive ? Theme.primary : "transparent"

                border.color: Theme.bg
                border.width: 2

                Text {
                    anchors.centerIn: parent
                    text: index + 1

                    color: isActive ? Theme.bg : Theme.fg

                    font {
                        pixelSize: Theme.fontSize
                        bold: true
                        family: Theme.fontFamily
                    }

                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: Hyprland.dispatch("workspace " + (index + 1))

                    //onEntered: workspaceButton.color = Theme.colCyan
                    //onExited: workspaceButton.color = isActive ? Theme.colCyan : "transparent"
                }

                Behavior on color {
                    ColorAnimation {
                        duration: 100
                    }
                }
            }

        }
    }
}
