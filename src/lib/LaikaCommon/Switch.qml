import QtQuick
import QtQuick.Templates as T

T.Switch {
    id: control

    implicitWidth: indicator.implicitWidth
    implicitHeight: background.implicitHeight
    opacity: enabled ? 1 : Theme.grayedOutOpacity

    background: Rectangle {
        implicitWidth: 140
        implicitHeight: Theme.baseSize * 3.8
        color: "transparent"
    }

    leftPadding: 4

    indicator: Rectangle {
        id: switchHandle

        property color trackGradient1: Theme.colors.switchTrackStart
        property color trackGradient2: Theme.colors.switchTrackEnd
        property color trackBorder: Theme.colors.switchTrackBorder

        implicitWidth: Theme.baseSize * 4.8
        implicitHeight: Theme.baseSize * 2.6
        x: control.leftPadding
        anchors.verticalCenter: parent.verticalCenter
        radius: Theme.baseSize * 1.3

        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                position: 0.0
                color: switchHandle.trackGradient1
            }
            GradientStop {
                position: 1.0
                color: switchHandle.trackGradient2
            }
        }
        border.color: switchHandle.trackBorder

        Rectangle {
            id: nub

            width: Theme.baseSize * 2.6
            height: Theme.baseSize * 2.6
            radius: Theme.baseSize * 1.3
            border.color: Theme.colors.switchNubBorder
            // we want the color below to bleed through a bit
            opacity: 0.8

            gradient: Gradient {
                orientation: Gradient.Vertical
                GradientStop {
                    position: 0.0
                    color: Theme.colors.switchNubBackStart
                }
                GradientStop {
                    position: 1.0
                    color: Theme.colors.switchNubBackEnd
                }
            }

            Rectangle {
                id: nubInset
                anchors.fill: parent
                anchors.margins: 1
                radius: parent.radius
                color: "transparent"
                border.color: Theme.colors.switchNubBorderInside
                border.width: 1
            }
        }
    }

    states: [
        State {
            name: "off"
            when: !control.checked && !control.down
        },
        State {
            name: "on"
            when: control.checked && !control.down

            PropertyChanges {
                switchHandle.trackGradient1: Theme.colors.switchTrackStartSelected
                switchHandle.trackGradient2: Theme.colors.switchTrackEndSelected
                switchHandle.trackBorder: Theme.colors.switchTrackBorderSelected
                nub.x: switchHandle.width - nub.width
            }
        },
        State {
            name: "off_down"
            when: !control.checked && control.down

            PropertyChanges {
                switchHandle.trackBorder: Theme.colors.switchTrackBorderSelected
            }
        },
        State {
            name: "on_down"
            extend: "off_down"
            when: control.checked && control.down

            PropertyChanges {
                nub {
                    x: switchHandle.width - nub.width
                }

                switchHandle.trackBorder: Theme.colors.switchTrackBorder
            }
        }
    ]
}
