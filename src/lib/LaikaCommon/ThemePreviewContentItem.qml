import QtQuick
import QtQuick.Layouts
import LaikaCommon

ColumnLayout {
    property string themeName: "System"
    property ThemeColors themeColors: ThemeColors {}
    property int buttonRadius: 5

    property var windowBorder: themeColors.windowBackground.hslLightness < 0.5 ? Qt.darker(themeColors.windowBackground, 0.9) : Qt.lighter(themeColors.windowBackground, 0.9)

    id: mainColumnLayout

    Layout.margins: 5
    implicitWidth: previewRectangle.implicitWidth + Layout.leftMargin + Layout.rightMargin

    Rectangle {
        id: previewRectangle

        radius: buttonRadius
        implicitWidth: 100
        implicitHeight: 75

        color: themeColors.windowBackground
        border.color: windowBorder
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

                anchors.topMargin: 3
                anchors.top: mockText.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                implicitHeight: 30

                color: themeColors.buttonBorder

                Rectangle {
                    id: mockButtonInside

                    anchors.fill: parent
                    anchors.margins: 1
                    radius: parent.radius
                    border.color: themeColors.buttonBorderInside
                    border.width: 1

                    gradient: Gradient {
                        orientation: Gradient.Vertical
                        GradientStop { position: 0.0; color: themeColors.buttonBackStart }
                        GradientStop { position: 1.0; color: themeColors.buttonBackEnd }
                    }

                    Text {
                        text: "Button"
                        color: themeColors.buttonText
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
