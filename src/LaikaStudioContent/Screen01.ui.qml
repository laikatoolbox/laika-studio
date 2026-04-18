

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import LaikaStudio
import com.kdab.dockwidgets 2.0 as KDDW

Rectangle {
    width: 700
    height: 500

    color: Constants.backgroundColor

    Text {
        text: qsTr("Hello LaikaStudio")
        anchors.centerIn: parent
        font.family: Constants.font.family
    }


    KDDW.DockingArea {
        id: root
        anchors.fill: parent

        // Each main layout needs a unique id
        uniqueName: "MainLayout-1"

        KDDW.DockWidget {
            id: dock6
            uniqueName: "dock6"
            Rectangle {
                color: "#2E8BC0"
                anchors.fill: parent
            }
        }
    }
}
