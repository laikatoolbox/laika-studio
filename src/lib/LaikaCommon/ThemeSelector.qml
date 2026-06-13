import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import LaikaCommon

ColumnLayout {
    id: mainLayout

    property bool systemInDarkMode: Application.styleHints.colorScheme === Qt.ColorScheme.Dark
    property ThemeColors automaticThemeColors: LightThemeColors {}
    property ThemeColors darkThemeColors: DarkThemeColors {}
    property ThemeColors lightThemeColors: LightThemeColors {}

    states: [
        State {
            name: "darkMode"
            when: systemInDarkMode
            PropertyChanges {
                mainLayout.automaticThemeColors: mainLayout.darkThemeColors
            }

        },
        State {
            name: "lightMode"
            when: !systemInDarkMode
            PropertyChanges {
                mainLayout.automaticThemeColors: mainLayout.lightThemeColors
            }
        }
    ]

    TabBar {
        id: tabBar
        Layout.alignment: Qt.AlignCenter

        // change theme based on selected
        onCurrentIndexChanged: {
            switch (tabBar.currentIndex) {
            case 0:
                Theme.setTheme("auto")
                break
            case 1:
                Theme.setTheme("dark")
                break
            case 2:
                Theme.setTheme("light")
                break
            }
        }

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
                themeColors: darkThemeColors
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
