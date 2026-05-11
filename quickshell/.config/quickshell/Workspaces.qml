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

                color: isActive ? bar.colCyan : "transparent"

                border.color: bar.colBg
                border.width: 2

                Text {
                    anchors.centerIn: parent
                    text: index + 1

                    color: isActive ? bar.colBg : bar.colFg

                    font {
                        pixelSize: bar.fontSize
                        bold: true
                        family: bar.fontFamily
                    }

                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onClicked: Hyprland.dispatch("workspace " + (index + 1))

                    //onEntered: workspaceButton.color = bar.colCyan
                    //onExited: workspaceButton.color = isActive ? bar.colCyan : "transparent"
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
