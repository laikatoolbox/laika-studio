import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import LaikaCommon

ColumnLayout {
    id: mainLayout

    property bool darkMode: Application.styleHints.colorScheme === Qt.ColorScheme.Dark
    property ThemeColors automaticThemeColors: LightThemeColors {}
    property ThemeColors redThemeColors: DarkThemeColors {}
    property ThemeColors lightThemeColors: LightThemeColors {}

    states: [
        State {
            name: "darkMode"
            when: darkMode
            PropertyChanges {
                mainLayout.automaticThemeColors: mainLayout.redThemeColors
            }
        },
        State {
            name: "lightMode"
            when: !darkMode
            PropertyChanges {
                mainLayout.automaticThemeColors: mainLayout.lightThemeColors
            }
        }
    ]

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
                themeColors: automaticThemeColors
            }
        }

        TabButton {
            id: darkTab
            text: qsTr("Dark")

            padding: 5
            implicitWidth: darkThemePreview.implicitWidth + leftPadding + rightPadding
            width: implicitWidth

            contentItem: ThemePreviewContentItem {
                id: darkThemePreview
                themeName: darkTab.text
                themeColors: redThemeColors
            }
        }

        TabButton {
            id: lightTab
            text: qsTr("Light")

            padding: 5
            implicitWidth: lightThemePreview.implicitWidth + leftPadding + rightPadding
            width: implicitWidth

            contentItem: ThemePreviewContentItem {
                id: lightThemePreview
                themeName: lightTab.text
                themeColors: lightThemeColors
            }
        }
    }
}
