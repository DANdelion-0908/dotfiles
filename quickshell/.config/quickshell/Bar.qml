import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
    id: bar

    property color colBg: "#1a1b26"
    property color colFg: "#a9b1d6"
    property color colMuted: "#444b6a"
    property color colCyan: "#0db9d7"
    property color colBlue: "#7aa2f7"
    property color colYellow: "#e0af68"
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 14

    Variants {
        model: Quickshell.screens

        PanelWindow {
            color: "transparent"

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            RowLayout {
                anchors.fill: parent
                spacing: 300

                Rectangle {
                    color: bar.colBg

                    implicitWidth: 120
                    implicitHeight: 30

                    radius: 50

                    Workspaces {
                        anchors.left: parent.left
                    }
                }

                Rectangle {
                    color: bar.colBg
                    implicitWidth: 250
                    implicitHeight: 30
                    radius: 50

                    ClockWidget {
                        anchors.centerIn: parent
                        color: bar.colFg
                        font.family: bar.fontFamily
                        font.pixelSize: bar.fontSize
                    }
                }
            }
        }
    }
}
