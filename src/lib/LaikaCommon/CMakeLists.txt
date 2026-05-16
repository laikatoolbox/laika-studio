set_source_files_properties(Theme.qml PROPERTIES
    QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(LaikaCommon
    STATIC
    URI LaikaCommon
    VERSION 0.1

    SOURCES
        laika-common.h
        ThemeColors.h
        ThemeColors.cpp

    QML_FILES
        DarkThemeColors.qml
        LightThemeColors.qml
        Theme.qml
        Button.qml
        CheckBox.qml
        Switch.qml
        ThemePreview.qml
        ThemeSelector.qml
        TextArea.qml
        ThemePreviewContentItem.qml

    OUTPUT_DIRECTORY
        ${CMAKE_BINARY_DIR}/LaikaCommon
)

find_package(Qt6 REQUIRED COMPONENTS Gui)
target_link_libraries(LaikaCommon PRIVATE Qt6::Gui)