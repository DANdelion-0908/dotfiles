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
        model: Quickshell.screens;


        PanelWindow {
            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            Rectangle {
                anchors.fill: parent
                color: bar.colBg
                radius: 6
            }

            Workspaces {
                anchors.left: parent.left
            }

            ClockWidget {
                anchors.centerIn: parent
                color: bar.colFg
                font.family: bar.fontFamily
                font.pixelSize: bar.fontSize
            }
        }
    }
}
