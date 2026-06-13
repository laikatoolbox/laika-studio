import QtQuick
import QtQuick.Effects
import QtQuick.Templates as T

T.TabButton {
    id: control
    font: Theme.font
    implicitWidth: Math.max(background ? background.implicitWidth : 0, contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0, contentItem.implicitHeight + topPadding + bottomPadding)
    horizontalPadding: 10
    verticalPadding: 5
    hoverEnabled: true

    // Get relative positioning to other TabButtons
    property list<TabButton> parentTabButtons: this.parent.children.filter(child => child instanceof TabButton)
    property bool isFirst: parentTabButtons[0] === this
    property bool isLast: parentTabButtons[parentTabButtons.length - 1] === this
    property bool isSecondToLast: parentTabButtons.length > 2 && parentTabButtons[parentTabButtons.length - 2] === this

    background: Rectangle {
        id: buttonBackground
        implicitWidth: 0
        implicitHeight: 0
        opacity: enabled ? 1 : 0.5

        // Only round left corners if we're the first tab
        bottomLeftRadius: (isFirst) ? Theme.elementRounding : 0
        topLeftRadius: (isFirst) ? Theme.elementRounding : 0
        // Only round right corners if we're the last tab
        bottomRightRadius: (isLast) ? Theme.elementRounding : 0
        topRightRadius: (isLast) ? Theme.elementRounding : 0

        // We also want to delete double borders, but QML is stupid in that it
        // doesn't let you modify the Rectangle border elements individually,
        // so we have to fake it

        // For start and end elements, we can use the regular border
        border.color: Theme.colors.buttonBorder
        border.width: (isFirst || isLast) ? 1 : 0

        // For every element inbetween the first and last, just render
        // 1px-wide rectangles on the top, bottom, and right for the border
        // Right (skip on second to last):
        Rectangle {
            width: !(isFirst || isLast || isSecondToLast) ? 1 : 0
            height: parent.height
            anchors.right: parent.right
            color: Theme.colors.buttonBorder
        }
        // Top:
        Rectangle {
            width: parent.width
            height: !(isFirst || isLast) ? 1 : 0
            anchors.top: parent.top
            color: Theme.colors.buttonBorder
        }
        // Bottom:
        Rectangle {
            width: parent.width
            height: !(isFirst || isLast) ? 1 : 0
            anchors.bottom: parent.bottom
            color: Theme.colors.buttonBorder
        }

        property color gradient1: Theme.colors.buttonBackStart
        property color gradient2: Theme.colors.buttonBackEnd
        property color insetBorder: Theme.colors.buttonBorderInside

        // Inset rectangle
        Rectangle {
            anchors.fill: parent
            color: "transparent"
            border.color: buttonBackground.insetBorder
            border.width: 1
            // Only round left corners if we're the first tab
            bottomLeftRadius: (isFirst) ? Theme.elementRounding : 0
            topLeftRadius: (isFirst) ? Theme.elementRounding : 0
            // Only round right corners if we're the last tab
            bottomRightRadius: (isLast) ? Theme.elementRounding : 0
            topRightRadius: (isLast) ? Theme.elementRounding : 0

            anchors.topMargin: 1
            anchors.bottomMargin: 1
            // On first and last, we have a left border
            anchors.leftMargin: (isFirst || isLast) ? 1 : 0
            // On every element except second to last we have a right one too
            anchors.rightMargin: (isSecondToLast) ? 0 : 1
        }

        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                position: 0.0
                color: buttonBackground.gradient1
            }
            GradientStop {
                position: 1.0
                color: buttonBackground.gradient2
            }
        }
        height: parent.height
        anchors.left: parent.left
        states: [
            State {
                name: "normal"
                when: !(control.down || control.activeFocus || control.hovered || control.checked)
                PropertyChanges {
                    buttonBackground.gradient1: Theme.colors.buttonBackStart
                    buttonBackground.gradient2: Theme.colors.buttonBackEnd
                    buttonBackground.insetBorder: Theme.colors.buttonBorderInside
                    buttonBackground.border.color: Theme.colors.buttonBorder
                }
            },
            State {
                name: "down"
                when: (control.down || control.checked)
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
                when: !(control.down || control.activeFocus || control.hovered || control.checked)
                PropertyChanges {
                    textItem.color: Theme.colors.buttonText
                }
            },
            State {
                name: "down"
                when: (control.down || control.checked)
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
