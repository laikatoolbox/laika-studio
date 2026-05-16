import QtQuick
import QtQuick.Effects
import QtQuick.Templates as T

T.TextArea {
    id: control
    font: Theme.font

    background: Rectangle {
        color: Theme.colors.inputBackground
        border.color: Theme.colors.inputBorder
    }
}

