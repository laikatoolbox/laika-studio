import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

ColumnLayout {
    TabBar {
        id: mainBar
        Layout.fillWidth: true

        TabButton {
            text: qsTr("Standard QML")
        }

        TabButton {
            text: qsTr("Standard QML 2")
        }

        TabButton {
            text: qsTr("Split View H")
        }

        TabButton {
            text: qsTr("Split View V")
        }

        TabButton {
            text: qsTr("Custom 1")
        }

        TabButton {
            text: qsTr("Custom 2")
        }
    }

    StackLayout {
        Layout.margins: 10
        currentIndex: mainBar.currentIndex

        Item {
            id: standardTab

            RowLayout {
                anchors.fill: parent
                anchors.centerIn: parent

                ContextMenu.menu: Menu {
                    MenuItem {
                        text: qsTr("Eat Tomato")
                    }
                    MenuItem {
                        text: qsTr("Throw Tomato")
                    }
                    MenuItem {
                        text: qsTr("Squash Tomato")
                    }
                }

                Dialog {
                    id: testModal
                    modal: true
                    title: "Test Modal"
                    standardButtons: Dialog.Ok | Dialog.Cancel
                    anchors.centerIn: parent

                    Column {
                        anchors.fill: parent
                        Text {
                            text: "Here goes all your custom elements..."
                        }

                        TextInput {
                            id: edtInput
                            text: "Input text"
                        }
                    }
                }

                ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                    Button {
                        text: qsTr("Button")
                    }

                    Button {
                        text: qsTr("Button (Disabled)")
                        enabled: false
                    }

                    Button {
                        text: qsTr("Display test modal")
                        onClicked: testModal.open()
                    }

                    DelayButton {
                        delay: 2000
                        text: "Delay Button"
                    }

                    DelayButton {
                        delay: 2000
                        text: "Delay Button (Disabled)"
                        enabled: false
                    }

                    ComboBox {
                        model: ["First", "Second", "Third"]
                    }

                    ComboBox {
                        editable: true
                        model: ["A", "B", "C", "D"]
                    }

                    ComboBox {
                        model: ["Disabled"]
                        enabled: false
                    }

                    Dial {
                        inputMode: "Circular"
                    }
                }

                ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                    Label {
                        text: "Hello world from a label!"
                    }

                    CheckBox {
                        checkState: Qt.Checked
                        text: qsTr("Checked")
                    }

                    CheckBox {
                        checkState: Qt.PartiallyChecked
                        text: qsTr("Partial")
                    }

                    CheckBox {
                        checkState: Qt.Unchecked
                        text: qsTr("Unchecked")
                    }

                    CheckBox {
                        checkState: Qt.Checked
                        enabled: false
                        text: qsTr("Checked (Disabled)")
                    }

                    CheckBox {
                        checkState: Qt.PartiallyChecked
                        enabled: false
                        text: qsTr("Partial (Disabled)")
                    }

                    CheckBox {
                        checkState: Qt.Unchecked
                        enabled: false
                        text: qsTr("Unchecked (Disabled)")
                    }

                    ProgressBar {
                        value: 0.5
                    }

                    ProgressBar {
                        indeterminate: true
                    }

                    RadioButton {
                        checked: true
                        text: qsTr("Checked")
                    }

                    RadioButton {
                        checked: false
                        text: qsTr("Unchecked")
                    }

                    RadioButton {
                        checked: true
                        enabled: false
                        text: qsTr("Checked (Disabled)")
                    }

                    RadioButton {
                        checked: false
                        enabled: false
                        text: qsTr("Unchecked (Disabled)")
                    }
                }

                ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                    SpinBox {
                        value: 50
                    }

                    SpinBox {
                        value: 50
                        enabled: false
                    }

                    Slider {
                        from: 1
                        value: 25
                        to: 100
                    }

                    Slider {
                        from: 1
                        value: 25
                        to: 100
                        enabled: false
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        Slider {
                            from: 1
                            value: 25
                            to: 100
                            Layout.maximumHeight: 100
                            orientation: Qt.Vertical
                        }

                        Slider {
                            from: 1
                            value: 25
                            to: 100
                            Layout.maximumHeight: 100
                            orientation: Qt.Vertical
                            enabled: false
                        }
                    }

                    Switch {
                        text: qsTr("Switch")
                        checked: true
                    }

                    Switch {
                        text: qsTr("Switch")
                        checked: false
                    }

                    Switch {
                        text: qsTr("Switch (Disabled)")
                        checked: true
                        enabled: false
                    }

                    Switch {
                        text: qsTr("Switch (Disabled)")
                        checked: false
                        enabled: false
                    }
                }

                ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                    RangeSlider {
                        from: 1
                        to: 100
                        first.value: 25
                        second.value: 75
                    }

                    RangeSlider {
                        from: 1
                        to: 100
                        first.value: 25
                        second.value: 75
                        enabled: false
                    }

                    RoundButton {
                        text: "Round"
                    }

                    RoundButton {
                        text: "Round (Disabled)"
                        enabled: false
                    }

                    ListModel {
                        id: fruitModel
                        ListElement {
                            name: "Apple"
                            color: "green"
                        }
                        ListElement {
                            name: "Cherry"
                            color: "red"
                        }
                        ListElement {
                            name: "Banana"
                            color: "yellow"
                        }
                        ListElement {
                            name: "Orange"
                            color: "orange"
                        }
                        ListElement {
                            name: "Watermelon"
                            color: "pink"
                        }
                    }

                    SortFilterProxyModel {
                        id: fruitFilter
                        model: fruitModel
                        sorters: [
                            RoleSorter {
                                roleName: "name"
                            }
                        ]
                        filters: [
                            FunctionFilter {
                                property var regExp: new RegExp(fruitSearch.text, "i")
                                onRegExpChanged: invalidate()
                                function filter(data: CustomData): bool {
                                    return regExp.test(data.name);
                                }
                            }
                        ]
                    }

                    SearchField {
                        id: fruitSearch
                        suggestionModel: fruitFilter
                        textRole: "name"
                    }

                    ScrollView {
                        Layout.maximumHeight: 200
                        Layout.maximumWidth: 350

                        Label {
                            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nSed vitae est et nisi dictum fringilla eget sed lectus.\n Etiam dapibus elementum lorem sit amet malesuada. Phasellus tortor tortor, iaculis in velit sed, mollis venenatis magna.\nDuis elementum at nibh non ornare. Vivamus id ante molestie mauris malesuada porttitor. In sit amet mattis orci. Ut posuere condimentum aliquet. Fusce ullamcorper rutrum velit, sit amet hendrerit nulla faucibus quis. Fusce tortor metus, tincidunt ut bibendum egestas, volutpat ut purus. Quisque lacinia mauris nec ultrices porta. Maecenas libero est, finibus vel tristique et, sagittis quis purus. Maecenas sed pellentesque eros, et pulvinar dui. Etiam in sem at turpis vulputate maximus eget facilisis leo. Duis cursus varius augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vivamus tincidunt cursus lacus nec hendrerit. "
                            font.pixelSize: 64
                        }
                    }
                }
            }
        }

        Item {
            id: standard2

            RowLayout {
                anchors.fill: parent
                anchors.centerIn: parent

                ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    Layout.margins: 10

                    TextArea {
                        placeholderText: qsTr("Enter description")
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                }
            }
        }

        Item {
            id: splitViewH

            SplitView {
                anchors.fill: parent
                orientation: Qt.Horizontal

                Rectangle {
                    implicitWidth: 200
                    SplitView.maximumWidth: 400
                    color: "lightblue"
                    Label {
                        text: "View 1"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    SplitView.minimumWidth: 50
                    SplitView.fillWidth: true
                    color: "lightgray"
                    Label {
                        text: "View 2"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    implicitWidth: 200
                    color: "lightgreen"
                    Label {
                        text: "View 3"
                        anchors.centerIn: parent
                    }
                }
            }
        }

        Item {
            id: splitViewV

            SplitView {
                anchors.fill: parent
                orientation: Qt.Vertical

                Rectangle {
                    implicitHeight: 200
                    SplitView.maximumHeight: 400
                    color: "lightblue"
                    Label {
                        text: "View 1"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    SplitView.minimumHeight: 50
                    SplitView.fillHeight: true
                    color: "lightgray"
                    Label {
                        text: "View 2"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    implicitHeight: 200
                    color: "lightgreen"
                    Label {
                        text: "View 3"
                        anchors.centerIn: parent
                    }
                }
            }
        }

        Item {
            id: custom1

            Rectangle {
                anchors.fill: parent

                color: "red"
            }
        }

        Item {
            id: custom2
            Text {
                text: "Tab 3"
            }
        }
    }

    component CustomData: QtObject {
        property string name
    }
}
