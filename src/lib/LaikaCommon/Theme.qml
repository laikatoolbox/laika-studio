pragma Singleton

import QtQuick

QtObject {
    property int elementRounding: 5
    property color windowBackground: "#dddddd"
    property color viewportBackground: "#272727"

    property color buttonBorder: "#b3b3b3"
    property color buttonBorderInside: "#ededed"
    property color buttonText: "#505050"
    property color buttonBackStart: "#f0f0f0"
    property color buttonBackEnd: "#e0e0e0"

    property color buttonBorderDown: "#878787"
    property color buttonBorderInsideDown: "#b1b1b1"
    property color buttonTextDown: "#2c2c2c"
    property color buttonBackStartDown: "#a8a8a8"
    property color buttonBackEndDown: "#bebebe"



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
