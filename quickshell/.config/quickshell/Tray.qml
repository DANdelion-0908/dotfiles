import QtQuick
import Quickshell
import Quickshell.Services.SystemTray

Item {
    implicitHeight: row.implicitHeight
    implicitWidth: row.implicitWidth

    Row {
        id: row

        spacing: 10
        anchors.fill: parent

        Repeater {
            model: SystemTray.items


            Image {
                id: trayIcon

                source: modelData.icon
                sourceSize: Qt.size(20, 20)

                width: 20
                height: 20

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton
                    onClicked: menu.open()
                }

                QsMenuAnchor {
                    id: menu
                    anchor.window: barWindow
                    anchor.item: trayIcon

                    menu: modelData.menu
                }
            }
        }
    }
}
