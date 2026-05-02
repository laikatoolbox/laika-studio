#include <QGuiApplication>
#include <QQuickStyle>
#include <QQmlApplicationEngine>

#include <kddockwidgets/Config.h>
#include <kddockwidgets/core/DockRegistry.h>
#include <kddockwidgets/core/TitleBar.h>
#include <kddockwidgets/qtquick/ViewFactory.h>
#include <kddockwidgets/qtquick/Platform.h>
#include <kddockwidgets/qtquick/views/DockWidget.h>
#include <kddockwidgets/qtquick/views/MainWindow.h>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    engine.addImportPath(":/lib/laika-common");
    QQuickStyle::setStyle("LaikaCommon");

    KDDockWidgets::initFrontend(KDDockWidgets::FrontendType::QtQuick);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("LaikaStudio", "Main");

    auto toolsDockWidget = KDDockWidgets::DockRegistry::self()->dockByName("toolsDockWidget", KDDockWidgets::DockRegistry::DockByNameFlag::SilentIfNotFound);
    if (toolsDockWidget != nullptr) {
        auto titleBar = toolsDockWidget->titleBar();
        titleBar->setFloatButtonVisible(false);
        titleBar->setCloseButtonVisible(false);
    }

    return QCoreApplication::exec();
}
