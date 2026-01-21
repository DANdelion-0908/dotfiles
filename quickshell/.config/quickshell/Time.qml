pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  readonly property string time: {
    Qt.formatDateTime(clock.date, "hh:mm AP | d MMM. yyyy")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}