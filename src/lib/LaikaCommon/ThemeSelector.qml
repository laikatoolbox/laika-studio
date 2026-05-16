import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import LaikaCommon

ColumnLayout {
    TabBar {
        Layout.alignment: Qt.AlignCenter

        TabButton {
            id: systemTab
            text: qsTr("System")

            padding: 5
            implicitWidth: systemThemePreview.implicitWidth + leftPadding + rightPadding
            width: implicitWidth

            contentItem: ThemePreviewContentItem {
                id: systemThemePreview
                themeName: systemTab.text
                themeColors: ThemeColors {
                    windowBackground: "red"
                }
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
