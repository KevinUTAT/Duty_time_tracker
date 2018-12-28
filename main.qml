import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3
import Qt.labs.calendar 1.0

ApplicationWindow {
    visible: true
    width: 480
    height: 640
    title: qsTr("Time Tracker")

    Timer {
        id: refrash_timer
        interval: 100;
        running: true;
        repeat: true;
        onTriggered: {
            master_clock.text = qsTr(Tracker.get_current_time())
            master_date.text = qsTr(Tracker.get_current_date())
        }
    }

    Pane {
        id: pane
        x: 18
        y: 18
        width: 444
        height: 90
        Material.elevation: 2

        Text {
            id: master_clock
            x: 54
            y: 11
            width: 313
            height: 46
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 42
        }
    }

    Pane {
        id: pane1
        x: 18
        y: 124
        width: 444
        height: 90
        Material.elevation: 2

        Text {
            id: master_date
            x: 22
            y: 17
            width: 376
            height: 33
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 32
        }
    }

    Pane {
        id: pane2
        x: 18
        y: 230
        width: 444
        height: 275
        Material.elevation: 2

        Button {
            id: button
            x: 149
            y: 89
            width: 123
            height: 73
            text: qsTr(Tracker.get_button_text())
            onClicked: {
                Tracker.on_button_clicked()
                button.text = qsTr(Tracker.get_button_text())
            }
        }
    }

    Pane {
        id: pane3
        x: 18
        y: 521
        width: 444
        height: 103
        Material.elevation: 2

        Button {
            id: view
            x: 170
            y: 16
            text: qsTr("View Log")
            onClicked: popup.open()
        }
    }

    Popup {
        id: popup
        x: 40
        y: 70
        width: 400
        height: 560
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape

        Grid {
            id: background_grid
            rows: 6
            columns: 7
            spacing: 1
            x: 31
            y: 70
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }

            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }

            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }

            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }

            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }

            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
            Rectangle { color: "#e8e8e8"; width: 44; height: 65 }
        }

        GridLayout {
            x: 5
            y: 40
            width: 337
            height: 422
            columns: 2

            DayOfWeekRow {
                locale: grid.locale

                Layout.column: 1
                Layout.fillWidth: true
            }

            WeekNumberColumn {
                month: grid.month
                year: grid.year
                locale: grid.locale

                Layout.fillHeight: true
                font.pointSize: 6
            }

            MonthGrid {
                id: grid
                month: Calendar.December
                year: 2018
                locale: Qt.locale("en_US")

                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        Button {
            id: back
            x: 0
            y: 0
            width: 30
            height: 30
            text: qsTr("<")
            background: Material.Grey
            onClicked: {
                if (grid.month == Calendar.January)
                {
                    grid.month = Calendar.December;
                    grid.year = grid.year - 1;
                }
                else
                {
                grid.month = grid.month - 1
                }
            }
        }

        Text {
            id: month
            x: 40
            y: 0
            width: 300
            height: 30
            text: qsTr(grid.title)
            font.pointSize: 12
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Button {
            id: forward
            x: 350
            y: 0
            width: 30
            height: 30
            text: qsTr(">")
            background: Material.Grey
            onClicked:
            {
                if (grid.month == Calendar.December)
                {
                    grid.month = Calendar.January;
                    grid.year = grid.year + 1;
                }
                else
                {
                grid.month = grid.month + 1
                }
            }
        }
    }
}
