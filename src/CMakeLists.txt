cmake_minimum_required(VERSION 3.21.1)

option(LINK_INSIGHT "Link Qt Insight Tracker library" ON)
option(BUILD_QDS_COMPONENTS "Build design studio components" ON)

project(LaikaStudioApp LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)
set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    CACHE STRING "Import paths for Qt Creator's code model"
    FORCE
)

# QT
find_package(Qt6 6.8 REQUIRED COMPONENTS Core Gui Widgets Qml Quick QuickTimeline ShaderTools)
qt_standard_project_setup()

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

qt_add_executable(${CMAKE_PROJECT_NAME})
qt_add_resources(${CMAKE_PROJECT_NAME} "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf)

# link the dock widgets from earlier
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE KDAB::kddockwidgets)

include(qds)

if (BUILD_QDS_COMPONENTS)
    include(qmlcomponents OPTIONAL)
endif()

if (LINK_INSIGHT)
    include(insight OPTIONAL)
endif ()

include(GNUInstallDirs)
install(TARGETS ${CMAKE_PROJECT_NAME}
  BUNDLE DESTINATION .
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
