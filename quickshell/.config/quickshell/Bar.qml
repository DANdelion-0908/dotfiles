import QtQuick
import Quickshell
import QtQuick.Layouts
import "."

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            color: Theme.blurBg
            implicitHeight: 40

            anchors {
                top: true
                left: true
                right: true
            }

            RowLayout {
                anchors {
                    fill: parent

                    leftMargin: 10
                    rightMargin: 10
                }
                spacing: 20

                Rectangle {
                    color: Theme.bg

                    Layout.preferredWidth: 240
                    Layout.preferredHeight: 30

                    radius: 50

                    Workspaces {
                        anchors.left: parent.left
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                Rectangle {
                    color: Theme.secondary
                    Layout.preferredWidth: 280
                    Layout.preferredHeight: 30
                    radius: 50

                    ClockWidget {
                        anchors.centerIn: parent
                        color: Theme.bg
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.fontSize
                    }
                }

                Item {
                    Layout.fillWidth: true
                }

                Rectangle {
                    color: Theme.bg
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 30
                    radius: 50

                    Tray {
                        anchors.centerIn: parent
                    }
                }

                Rectangle {
                    color: Theme.primary
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 30
                    radius: 50

                    Power {
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}
