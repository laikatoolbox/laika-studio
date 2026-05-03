import QtQuick
import QtQuick.Controls
import com.kdab.dockwidgets as KDDW
import LaikaCommon

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Laika Studio")
    color: Theme.windowBackground

    ThemeDemo {
        anchors.fill: parent
    }

    /*Button {
        id: button
        text: qsTr("Show Theme Demo")
        anchors.centerIn: parent
    }*/

  /*  KDDW.DockWidget {
        id: toolsDockWidget
        uniqueName: "toolsDockWidget"
        title: "Tools"

        Rectangle {
            color: "#85baa1"
            anchors.fill: parent
        }
    }

    KDDW.DockWidget {
        id: timelineLayersDockWidget
        uniqueName: "timelineLayersDockWidget"
        title: "Timeline"

        Rectangle {
            color: Theme.mainColor //"#0000ff"
            anchors.fill: parent
            Text {
                text: "Timeline/Layers"
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
            top: parent.top
        }

        uniqueName: "MyMainLayout"

        Component.onCompleted: {
            addDockWidget(timelineLayersDockWidget, KDDW.KDDockWidgets.Location_OnBottom, null, Qt.size(0, 100));
            addDockWidget(toolsDockWidget, KDDW.KDDockWidgets.Location_OnLeft, null, Qt.size(50, 0));
        }
    }*/
}
