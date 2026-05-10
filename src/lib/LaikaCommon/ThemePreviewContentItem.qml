import QtQuick
import QtQuick.Layouts

ColumnLayout {
    property color previewBackground: "#dddddd"

    implicitWidth: previewRectangle.implicitWidth + previewText.implicitWidth
    implicitHeight: previewRectangle.implicitHeight + previewText.implicitHeight

    Rectangle {
        id: previewRectangle
        radius: 5
        implicitWidth: 100
        implicitHeight: 100
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "lightsteelblue"
            }
            GradientStop {
                position: 1.0
                color: "blue"
            }
        }
    }

    Text {
        id: previewText
        text: "Theme"
    }
}
