import QtQuick

Rectangle {
    color: Qt.hsla(0, 0, 0.1, 1.0)
    anchors.fill: parent

    Rectangle {
        id: canvas
        color: "white"
        anchors.centerIn: parent
        width: 300
        height: 125

        Text {
            text: "I'm the canvas"
            anchors.centerIn: parent
        }
    }
}
