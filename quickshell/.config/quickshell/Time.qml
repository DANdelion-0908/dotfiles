pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick


Singleton {
    id: time

    readonly property string time: {
        Qt.formatDateTime(clock.date, "| hh:mm AP | ddd, MMM d yyyy |")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
