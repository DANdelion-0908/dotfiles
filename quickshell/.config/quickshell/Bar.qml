import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.UPower
import "."

Scope {
    Variants {
        model: Quickshell.screens

        delegate: Component {
            PanelWindow {
                color: "transparent"
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
                            id: workspaces
                            anchors.left: parent.left
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Rectangle {
                        color: Theme.primary
                        Layout.preferredWidth: 280
                        Layout.preferredHeight: 30
                        radius: 50

                        ClockWidget {
                            anchors.centerIn: parent
                            color: Theme.fg
                            font.family: Theme.fontFamily
                            font.pixelSize: Theme.fontSize
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Rectangle {
                        color: Theme.bg
                        implicitWidth: tray.implicitWidth + 20
                        implicitHeight: tray.implicitHeight + 10
                        radius: 50

                        Tray {
                            id: tray
                            anchors.centerIn: parent
                        }
                    }

                    Rectangle {
                        color: Theme.tertiary
                        Layout.preferredWidth: 100
                        Layout.preferredHeight: 30
                        radius: 50

                        visible: UPower.displayDevice.isLaptopBattery

                        Power {
                            anchors.centerIn: parent
                        }
                    }
                }
            }
        }
    }
}
