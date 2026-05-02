import QtQuick
import QtQuick.Controls
import LaikaCommon

Rectangle {
    color: Theme.viewportBackground
    anchors.fill: parent

    Rectangle {
        id: canvas
        color: "white"
        anchors.centerIn: parent
        width: 300
        height: 125



        Button {
            id: button
            text: qsTr("Test")
            anchors.centerIn: parent
        }

        /*Text {
            text: "I'm the canvas"
            anchors.centerIn: parent
        }*/
    }
}
