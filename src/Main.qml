import QtQuick
import com.kdab.dockwidgets as KDDW

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Laika Studio")

    Text {
        id: mainArea
        anchors.fill: parent
    }

    KDDW.DockWidget {
        id: layersDockWidget
        uniqueName: "layersDockWidget"
        title: "Layers"

        Rectangle {
            color: "#85baa1"
            anchors.fill: parent
            Text {
                text: "Layers"
                anchors.centerIn: parent
            }
        }
    }

    KDDW.DockWidget {
        id: timelineDockWidget
        uniqueName: "timelineDockWidget"
        title: "Timeline"

        Rectangle {
            color: "#0000ff"
            anchors.fill: parent
            Text {
                text: "Timeline"
                anchors.centerIn: parent
            }
        }
    }

    KDDW.DockingArea {
        id: dockWidgetArea
        anchors.fill: parent

        persistentCentralItemFileName: ":/Viewport.qml"
        options: KDDW.KDDockWidgets.MainWindowOption_HasCentralWidget

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: mainArea.bottom
        }

        uniqueName: "MyMainLayout"

        Component.onCompleted: {
            addDockWidget(timelineDockWidget, KDDW.KDDockWidgets.Location_OnBottom, null, Qt.size(0, 100));
            addDockWidget(layersDockWidget, KDDW.KDDockWidgets.Location_OnRight, null, Qt.size(200, 0));
        }
    }
}
