import QtQuick
import QtQuick.Layouts

ColumnLayout {
    property color previewBackground: "#dddddd"
    property string previewText: "System"

    id: mainColumnLayout

    Layout.margins: 5
    implicitWidth: previewRectangle.implicitWidth + Layout.leftMargin + Layout.rightMargin

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
        id: previewTextItem
        text: previewText
    }
}
