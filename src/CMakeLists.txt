cmake_minimum_required(VERSION 3.16)

project(laika-studio VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2 Widgets)

# Add in KDDockWidgets
add_subdirectory(lib/KDDockWidgets)
if(NOT TARGET kddockwidgets)
    # For the purpose of our example, we're looking for Qt5 or Qt6 KDDW.
    # For your own purposes, just chose the one you need.
    find_package(KDDockWidgets QUIET)
    if(NOT KDDockWidgets_FOUND)
        find_package(KDDockWidgets-qt6 REQUIRED)
    endif()
endif()

add_subdirectory(lib/LaikaCommon)

qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(laika-studio
    main.cpp
)

qt_add_qml_module(laika-studio
    URI LaikaStudio
    NO_RESOURCE_TARGET_PATH
    QML_FILES
        Main.qml
        Viewport.qml
        RESOURCES
            qtquickcontrols2.conf
            resources.qrc
        DEPENDENCIES
            TARGET LaikaCommon
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(laika-studio PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.laika-toolbox.laika-studio
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(laika-studio
    PRIVATE Qt6::Core Qt6::Quick Qt6::QuickControls2 KDAB::kddockwidgets LaikaCommonplugin
)

install(TARGETS laika-studio
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)