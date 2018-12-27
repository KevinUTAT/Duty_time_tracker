import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

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
        height: 388
        Material.elevation: 2

        Button {
            id: button
            x: 149
            y: 146
            width: 123
            height: 73
            text: qsTr(Tracker.get_button_text())
            onClicked: {
                Tracker.on_button_clicked()
                button.text = qsTr(Tracker.get_button_text())
            }
        }
    }
}
