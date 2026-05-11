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
                source: modelData.icon
                sourceSize: Qt.size(20, 20)

                width: 20
                height: 20
            }
        }
    }
}
