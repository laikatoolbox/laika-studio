import QtQuick
import QtQuick.Effects
import QtQuick.Templates as T

T.Button {
    id: control
    font: Theme.font
    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                                         contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                                          contentItem.implicitHeight + topPadding + bottomPadding)
    horizontalPadding: 10
    verticalPadding: 5
    hoverEnabled: true

    background: Rectangle {
        id: buttonBackground
        implicitWidth: 0
        implicitHeight: 0
        opacity: enabled ? 1 : Theme.grayedOutOpacity
        border.color: Theme.colors.buttonBorder
        border.width: 1
        radius: Theme.elementRounding

        property color gradient1: Theme.colors.buttonBackStart
        property color gradient2: Theme.colors.buttonBackEnd
        property color insetBorder: Theme.colors.buttonBorderInside

        Rectangle {
            id: buttonInsetBorder
            anchors.fill: parent
            anchors.margins: 1
            radius: parent.radius
            color: "transparent"
            border.color: buttonBackground.insetBorder
            border.width: 1
        }

        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0.0; color: buttonBackground.gradient1 }
            GradientStop { position: 1.0; color: buttonBackground.gradient2 }
        }

        states: [
            State {
                name: "normal"
                when: !(control.down || control.activeFocus || control.hovered)
                PropertyChanges {
                    buttonBackground.gradient1: Theme.colors.buttonBackStart
                    buttonBackground.gradient2: Theme.colors.buttonBackEnd
                    buttonBackground.insetBorder: Theme.colors.buttonBorderInside
                    buttonBackground.border.color: Theme.colors.buttonBorder
                }
            },
            State {
                name: "down"
                when: control.down
                PropertyChanges {
                    buttonBackground.gradient1: Theme.colors.buttonBackStartDown
                    buttonBackground.gradient2: Theme.colors.buttonBackEndDown
                    buttonBackground.insetBorder: Theme.colors.buttonBorderInsideDown
                    buttonBackground.border.color: Theme.colors.buttonBorderDown
                }
            },
            State {
                name: "focus"
                when: (control.activeFocus || control.hovered) && control.enabled
                PropertyChanges {
                    buttonBackground.gradient1: Theme.colors.buttonBackStartFocus
                    buttonBackground.gradient2: Theme.colors.buttonBackEndFocus
                    buttonBackground.insetBorder: Theme.colors.buttonBorderInsideFocus
                    buttonBackground.border.color: Theme.colors.buttonBorderFocus
                }
            }
        ]
    }

    contentItem: Text {
        id: textItem
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.5
        color: Theme.colors.buttonText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight

        states: [
            State {
                name: "normal"
                when: !(control.down || control.activeFocus || control.hovered)
            },
            State {
                name: "down"
                when: control.down
                PropertyChanges {
                    textItem.color: Theme.colors.buttonTextDown
                }
            },
            State {
                name: "focus"
                when: (control.activeFocus || control.hovered) && control.enabled
                PropertyChanges {
                    textItem.color: Theme.colors.buttonTextFocus
                }

            }
        ]
    }
}

