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
            id: systemTab
            text: qsTr("System")

            padding: 5
            implicitWidth: systemThemePreview.implicitWidth + leftPadding + rightPadding
            width: implicitWidth

            contentItem: ThemePreviewContentItem {
                id: systemThemePreview
                previewBackground: "red"
                previewText: systemTab.text
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
