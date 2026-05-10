import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

ColumnLayout {
    //Layout.fillWidth: true

    TabBar {
        //Layout.fillWidth: true
        Layout.alignment: Qt.AlignCenter

        TabButton {
            text: qsTr("System")

            contentItem: ThemePreviewContentItem {
                 previewBackground: "red"
             }
        }

        TabButton {
            text: qsTr("Dark")
        }

        TabButton {
            text: qsTr("Light")
        }
    }
}