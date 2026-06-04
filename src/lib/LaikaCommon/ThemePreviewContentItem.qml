import QtQuick
import QtQuick.Layouts
import LaikaCommon

ColumnLayout {
    property string themeName: "System"
    property ThemeColors themeColors: ThemeColors {}
    property int buttonRadius: 5

    property var windowBorder: themeColors.windowBackground.hslLightness < 0.5 ? Qt.darker(themeColors.windowBackground, 0.7) : Qt.lighter(themeColors.windowBackground, 0.7)

    id: mainColumnLayout

    Layout.margins: 5
    implicitWidth: previewRectangle.implicitWidth + Layout.leftMargin + Layout.rightMargin

    Rectangle {
        id: previewRectangle

        radius: buttonRadius
        implicitWidth: 100
        implicitHeight: 80

        color: themeColors.windowBackground
        border.color: windowBorder
        border.width: 1

        // Mock Toolbar
        Rectangle {
            id: mockToolbar
            anchors.margins: 1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            topLeftRadius: parent.topLeftRadius - 1
            topRightRadius: parent.topRightRadius - 1
            implicitHeight: 25
            color: themeColors.toolbarBorder

            Rectangle {
                id: mockToolbarInner
                anchors.bottomMargin: 1
                anchors.fill: parent
                topLeftRadius: parent.topLeftRadius - 1
                topRightRadius: parent.topRightRadius - 1

                gradient: Gradient {
                    orientation: Gradient.Vertical
                    GradientStop { position: 0.0; color: themeColors.toolbarBackStart }
                    GradientStop { position: 1.0; color: themeColors.toolbarBackEnd }
                }
            }
        }

        // Mock sidebar
        Rectangle {
            id: mockSidebar
            anchors.margins: 1
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.top: mockToolbar.bottom
            anchors.bottom: parent.bottom
            bottomLeftRadius: parent.bottomLeftRadius - 1
            implicitWidth: 40
            color: themeColors.sidebarBorder

            Rectangle {
                id: mockSidebarInner
                anchors.rightMargin: 1
                anchors.fill: parent
                bottomLeftRadius: parent.bottomLeftRadius - 1
                color: themeColors.sidebarBackground
            }
        }

        Item {
            id: mockLayout
            anchors.top: mockToolbar.bottom
            anchors.left: mockSidebar.right
            anchors.right: parent.right
            anchors.margins: 3
            height: mockText.implicitHeight + mockButton.implicitHeight + mockButton.anchors.topMargin


            // Mock text
            Text {
                id: mockText
                text: "Text"
                color: themeColors.windowText
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
                implicitWidth: mockButtonText.width + 10
                implicitHeight: mockButtonText.height + 10

                color: themeColors.buttonBorder

                Rectangle {
                    id: mockButtonInside

                    anchors.fill: parent
                    anchors.margins: 1
                    radius: parent.radius - 1
                    border.color: themeColors.buttonBorderInside
                    border.width: 1

                    gradient: Gradient {
                        orientation: Gradient.Vertical
                        GradientStop { position: 0.0; color: themeColors.buttonBackStart }
                        GradientStop { position: 1.0; color: themeColors.buttonBackEnd }
                    }

                    Text {
                        id: mockButtonText
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
