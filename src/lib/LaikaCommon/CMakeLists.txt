set_source_files_properties(Theme.qml PROPERTIES
    QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(LaikaCommon
    STATIC
    URI LaikaCommon
    VERSION 0.1
    SOURCES
        laika-common.h
    QML_FILES
        Theme.qml
        Button.qml
        CheckBox.qml
        Switch.qml
        ThemeDemo.qml
)
