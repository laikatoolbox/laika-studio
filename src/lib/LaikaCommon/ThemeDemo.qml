import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    anchors.margins: 5
    anchors.centerIn: parent

    ColumnLayout {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

        Button {
            text: qsTr("I'm A Button")
        }

        Button {
            text: qsTr("I'm Another Button")
        }

        Button {
            text: qsTr("I'm Another Button")
        }
    }

    ColumnLayout {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

        Button {
            text: qsTr("I'm A Button")
        }

        Button {
            text: qsTr("I'm Another Button")
        }

        Button {
            text: qsTr("I'm Another Button")
        }
    }

    ColumnLayout {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

        Button {
            text: qsTr("I'm A Button")
        }

        Button {
            text: qsTr("I'm Another Button")
        }

        Button {
            text: qsTr("I'm Another Button")
        }
    }
}