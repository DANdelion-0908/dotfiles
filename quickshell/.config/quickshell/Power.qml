import Quickshell
import QtQuick
import Quickshell.Services.UPower

Item {
    id: power

    Row {
        anchors.centerIn: parent
        spacing: 5

        Text {
            text: UPower.displayDevice.percentage * 100 + "%"
            color: bar.colFg
        }
    }
}
