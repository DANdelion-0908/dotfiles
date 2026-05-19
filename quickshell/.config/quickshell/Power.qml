import Quickshell
import QtQuick
import Quickshell.Services.UPower

Item {
    id: power

    Row {
        anchors.centerIn: parent
        spacing: 5

        Text {
            text: Math.round(UPower.displayDevice.percentage * 100) + "%"
            color: Theme.bg
            font: Theme.fontFamily
        }
    }
}
