import QtQuick
import com.kdab.dockwidgets as KDDW

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    KDDW.DockWidget {
        id: dock4
        uniqueName: "dock4"
        Rectangle {
            color: "#85baa1"
            anchors.fill: parent
            Text {
                font.pixelSize: 25
                text: "Four"
                anchors.centerIn: parent
            }
        }
    }

    KDDW.DockWidget {
        id: dock5
        uniqueName: "dock5"
        Rectangle {
            color: "#85baa1"
            anchors.fill: parent
            Text {
                font.pixelSize: 25
                text: "Five"
                anchors.centerIn: parent
            }
        }
    }

    KDDW.DockingArea {
        id: dockWidgetArea
        anchors.fill: parent

        uniqueName: "MyMainLayout"

        Component.onCompleted: {
            addDockWidget(dock4, KDDW.KDDockWidgets.Location_OnBottom);
            dock4.addDockWidgetAsTab(dock5);
        }
    }
}
