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
            implicitHeight: 30

            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                top: 10
                left: 10
                right: 10
                bottom: 0
            }

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    color: bar.colBg

                    implicitWidth: 315
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

                Rectangle {
                    color: bar.colBg
                    implicitWidth: 100
                    implicitHeight: 30
                    radius: 50

                    Tray {
                        anchors {
                            left: parent.left
                            top: parent.top
                            bottom: parent.bottom
                        }
                    }
                }

                Rectangle {
                    color: bar.colBg
                    implicitWidth: 100
                    implicitHeight: 30
                    radius: 50

                    Power {
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}
