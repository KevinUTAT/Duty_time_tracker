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
        y: 166
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
        y: 275
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
        y: 385
        width: 444
        height: 119
        Material.elevation: 2

        Button {
            id: button
            x: 149
            y: 10
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
            onClicked: {
                popup.open()
                Viewer.load_local()
                Viewer.update_inactive_tables()
                //morning_inactive.height_base = 65;
                for (var i = 0; i < 42; i ++)
                {
                    active_time.itemAt(i).childAt(0,0).height = Viewer.get_morning_inactive((i/7), (i%7)) * 0.65;
                    active_time.itemAt(i).childAt(44,65).height = Viewer.get_evening_inactive((i/7), (i%7)) * 0.65;
                    active_time.itemAt(i).childAt(44,65).y = 65 - Viewer.get_evening_inactive((i/7), (i%7)) * 0.65;
                }
            }
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

            Repeater {
                id: active_time
                model: 42;
                delegate: Rectangle {
                    color: "#8BC34A";
                    width: 44;
                    height: 65;
                    Rectangle {color: "#C5E1A5"; width: 44; height: 65}
                    Rectangle {color: "#C5E1A5"; width: 44; height: 65; x:44; y:65}
                }
            }

            /*
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }

            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }

            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }

            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }

            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }

            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            Rectangle { color: "#8BC34A"; width: 44; height: 65 }
            */
        }

/*
        Grid {
            id: morning_inactive_grid
            rows: 6
            columns: 7
            spacing: 1
            x: 31
            y: 70

            Repeater {
                id: morning_inactive;
                model: 42;
                Rectangle {
                    color: "#C5E1A5";
                    width: 44;
                    height: 65;
                    Text {
                        id: name
                        text: index
                    }
                }
            }
        }
*/

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
            onClicked: {
                if (grid.month == Calendar.January)
                {
                    grid.month = Calendar.December;
                    grid.year = grid.year - 1;

                    Viewer.change_focus_month(12);
                    Viewer.change_focus_year(grid.year);
                }
                else
                {
                    grid.month = grid.month - 1;
                    Viewer.change_focus_month(grid.month);
                }
                Viewer.update_inactive_tables();

                for (var i = 0; i < 42; i ++)
                {
                    active_time.itemAt(i).childAt(0,0).height = Viewer.get_morning_inactive((i/7), (i%7)) * 0.65;

                }
            }

            BorderImage {
                id: borderImage
                x: 0
                y: 0
                width: 480
                height: 145
                source: "DSC04785.JPG"
            }
        }

        Text {
            id: month_title
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
            onClicked:
            {
                if (grid.month == Calendar.December)
                {
                    grid.month = Calendar.January;
                    grid.year = grid.year + 1;

                    Viewer.change_focus_month(1);
                    Viewer.change_focus_year(grid.year);
                }
                else
                {
                    grid.month = grid.month + 1;
                    Viewer.change_focus_month(grid.month);
                }
                Viewer.update_inactive_tables();

                for (var i = 0; i < 42; i ++)
                {
                    active_time.itemAt(i).childAt(0,0).height = Viewer.get_morning_inactive((i/7), (i%7)) * 0.65;

                }
            }
        }
    }

}
