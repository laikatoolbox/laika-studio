import QtQuick
import QtQuick.Templates as T

T.CheckBox {
    id: control

    font: Theme.font

    opacity: enabled ? 1.0 : 0.5

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                                         contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                                          Math.max(contentItem.implicitHeight,
                                                   indicator ? indicator.implicitHeight : 0) + topPadding + bottomPadding)
    leftPadding: 4

    indicator: Rectangle {
        id: checkboxHandle

        property color gradient1: Theme.colors.buttonBackStart
        property color gradient2: Theme.colors.buttonBackEnd
        property color checkboxTick: (control.checkState === Qt.PartiallyChecked) ? Theme.colors.checkboxPartiallyCheckedTick : Theme.colors.checkboxCheckedTick
        property color checkboxBorderInset: (control.checkState === Qt.PartiallyChecked) ? Theme.colors.checkboxPartiallyCheckedBorderInset : Theme.colors.checkboxCheckedBorderInset

        implicitWidth: Theme.baseSize * 2.6
        implicitHeight: Theme.baseSize * 2.6
        x: control.leftPadding
        anchors.verticalCenter: parent.verticalCenter
        border.color: Theme.colors.buttonBorder
        border.width: 1
        radius: Theme.elementRounding

        Rectangle {
            id: buttonInsetBorder
            anchors.fill: checkboxHandle
            anchors.margins: 1
            radius: parent.radius
            color: "transparent"
            border.color: (control.checkState === Qt.Unchecked) ? Theme.colors.buttonBorderInside : checkboxHandle.checkboxBorderInset
            border.width: 1
        }

        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: checkboxHandle.gradient1 }
            GradientStop { position: 1.0; color: checkboxHandle.gradient2 }
        }

        Rectangle {
            id: rectangle
            anchors.centerIn: checkboxHandle
            visible: false
            color: "red"

            Text {
                id: indicatorText
                anchors.centerIn: rectangle
                color: checkboxHandle.checkboxTick
                text: (control.checkState === Qt.PartiallyChecked) ? "‒" : "✓"
                font.pointSize: 14
                font.bold: false
            }
        }

        states: [
            State {
                name: "unchecked"
                when: control.checkState == Qt.Unchecked && !control.down
            },
            State {
                name: "checked"
                when: control.checkState !== Qt.Unchecked && !control.down

                PropertyChanges {
                    rectangle.visible: true
                }
            },
            State {
                name: "unchecked_down"
                when: control.checkState == Qt.Unchecked && control.down

                PropertyChanges {
                    rectangle.color: Theme.mainColorDarker
                    checkboxHandle.border.color: Theme.mainColorDarker
                }
            },
            State {
                name: "partial"
                when: control.checkState == Qt.PartiallyChecked

                PropertyChanges {
                }
            },
            State {
                name: "checked_down"
                extend: "unchecked_down"
                when: control.checkState !== Qt.Unchecked  && control.down

                PropertyChanges {
                    rectangle.visible: true
                }
            }
        ]
    }

    background: Rectangle {
        implicitWidth: 140
        implicitHeight: Theme.baseSize * 3.8
        color: "transparent"
    }

    contentItem: Text {
        leftPadding: control.indicator.width + 4

        text: control.text
        font: control.font
        color: Theme.colors.windowText
        elide: Text.ElideRight
        visible: control.text
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }
}

