import QtQuick
import QtQuick.Layouts

ColumnLayout {    
    property string themeName: "System"

    property ThemeColors themeColors

    /* Window */

    property color windowBackground: "#dddddd"
    property color windowText: "#505050"

    /* Button */
    property color buttonBorder: "#b3b3b3"
    property color buttonBorderInside: "#ededed"
    property color buttonText: "#505050"
    property color buttonBackStart: "#f0f0f0"
    property color buttonBackEnd: "#e0e0e0"
    property int buttonRadius: 5

    property var windowBorder: windowBackground.hslLightness < 0.5 ? Qt.darker(windowBackground, 0.9) : Qt.lighter(windowBackground, 0.9)

    id: mainColumnLayout

    Layout.margins: 5
    implicitWidth: previewRectangle.implicitWidth + Layout.leftMargin + Layout.rightMargin

    Rectangle {
        id: previewRectangle

        radius: buttonRadius
        implicitWidth: 100
        implicitHeight: 75

        color: windowBackground
        border.color: themeColors.windowBackground
        border.width: 1

        ColumnLayout {
            id: mocksLayout
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 3

            // Mock text
            Text {
                id: mockText
                text: "Text"
                anchors.top: parent.top
                anchors.left: parent.left
            }

            // Mock Button
            Rectangle {
                id: mockButton
                radius: buttonRadius

                anchors.top: mockText.bottom + 3
                anchors.left: parent.left
                anchors.right: parent.right
                implicitHeight: 30

                color: buttonBorder

                Rectangle {
                    id: mockButtonInside

                    anchors.fill: parent
                    anchors.margins: 1
                    radius: parent.radius
                    border.color: buttonBorderInside
                    border.width: 1

                    gradient: Gradient {
                        orientation: Gradient.Vertical
                        GradientStop { position: 0.0; color: buttonBackStart }
                        GradientStop { position: 1.0; color: buttonBackEnd }
                    }

                    Text {
                        text: "Button"
                        color: buttonText
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                        anchors.centerIn: mockButtonInside
                    }
                }
            }

        }
    }

    Text {
        id: themeNameItem
        text: themeName
    }
}
