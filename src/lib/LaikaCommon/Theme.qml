pragma Singleton

import QtQuick
import LaikaCommon

QtObject {
    // Don't modify outside of this file (use setTheme())! If we should color the system theme (when it comes to dark/light mode)
    property string themeName: "auto";

    // The rounding in pixels to apply to elements
    property int elementRounding: 5

    // How much the opacity should be for grayed out (disabled elements)
    property real grayedOutOpacity: 0.4

    // The selected theme colors
    property ThemeColors colors: LightThemeColors {}

    // All the theme colors
    property ThemeColors darkThemeColors: DarkThemeColors {}
    property ThemeColors lightThemeColors: LightThemeColors {}

    readonly property color gray: "#b2b1b1"
    readonly property color lightGray: "#dddddd"
    readonly property color light: "#ffffff"
    readonly property color blue: "#2d548b"
    property color mainColor: "#17a81a"
    readonly property color dark: "#222222"
    readonly property color mainColorDarker: Qt.darker(mainColor, 1.5)

    property int baseSize: 8

    readonly property int smallSize: 10
    readonly property int largeSize: 16

    property font font
    font.bold: true
    font.underline: false
    font.pixelSize: 14
    font.family: "arial"

    // set the current theme
    function setTheme(newThemeName) {
        switch (newThemeName) {
        case "light":
            themeName = "light"
            break
        case "dark":
            themeName = "dark"
            break
        case "auto":
        default:
            themeName = "auto"
            break
        }

        applyTheme();
    }

    // apply the current theme
    function applyTheme() {
        console.log(`Changing theme to: ${themeName}`);

        switch (themeName) {
        case "light":
            colors = lightThemeColors
            break
        case "dark":
            colors = darkThemeColors
            break
        case "auto":
        default:
            colors = Application.styleHints.colorScheme === Qt.ColorScheme.Dark ? darkThemeColors : lightThemeColors
            break
        }

        //Qt.application.palette.windowText = colors.windowText
    }
}