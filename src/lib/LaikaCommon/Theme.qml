pragma Singleton

import QtQuick

QtObject {
    property int elementRounding: 5

    /* Window */
    property color windowBackground: "#dddddd"
    property color windowText: "#505050"
    property color viewportBackground: "#272727"

    /* Button */
    property color buttonBorder: "#b3b3b3"
    property color buttonBorderInside: "#ededed"
    property color buttonText: "#505050"
    property color buttonBackStart: "#f0f0f0"
    property color buttonBackEnd: "#e0e0e0"

    property color buttonBorderDown: "#8ea7ae"
    property color buttonBorderInsideDown: "#dce3e7"
    property color buttonTextDown: "#5b7982"
    property color buttonBackStartDown: "#c8d9e1"
    property color buttonBackEndDown: "#e0e6ea"

    property color buttonBorderFocus: "#8bbac9"
    property color buttonBorderInsideFocus: "#eaf6fa"
    property color buttonTextFocus: "#22586e"
    property color buttonBackStartFocus: "#e4f3f9"
    property color buttonBackEndFocus: "#cae0e8"











    readonly property color gray: "#b2b1b1"
    readonly property color lightGray: "#dddddd"
    readonly property color light: "#ffffff"
    readonly property color blue: "#2d548b"
    property color mainColor: "#17a81a"
    readonly property color dark: "#222222"
    readonly property color mainColorDarker: Qt.darker(mainColor, 1.5)

    property int baseSize: 10

    readonly property int smallSize: 10
    readonly property int largeSize: 16

    property font font
    font.bold: true
    font.underline: false
    font.pixelSize: 14
    font.family: "arial"
}
