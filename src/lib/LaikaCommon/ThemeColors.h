#ifndef THEMECOLORS_H
#define THEMECOLORS_H

#include <QObject>
#include <QColor>
#include <QtQmlIntegration>

class ThemeColors : public QObject
{
    Q_OBJECT

    // Window
    Q_PROPERTY(QColor windowBackground MEMBER windowBackground NOTIFY themeColorChanged)
    Q_PROPERTY(QColor windowText MEMBER windowText NOTIFY themeColorChanged)
    Q_PROPERTY(QColor viewportBackground MEMBER viewportBackground NOTIFY themeColorChanged)

    // Sidebar
    Q_PROPERTY(QColor sidebarBackground MEMBER sidebarBackground NOTIFY themeColorChanged)
    Q_PROPERTY(QColor sidebarBorder MEMBER sidebarBorder NOTIFY themeColorChanged)

    // Toolbar
    Q_PROPERTY(QColor toolbarBackStart MEMBER toolbarBackStart NOTIFY themeColorChanged)
    Q_PROPERTY(QColor toolbarBackEnd MEMBER toolbarBackEnd NOTIFY themeColorChanged)
    Q_PROPERTY(QColor toolbarBorder MEMBER toolbarBorder NOTIFY themeColorChanged)

    // Input (textboxes)
    Q_PROPERTY(QColor inputBackground MEMBER inputBackground NOTIFY themeColorChanged)
    Q_PROPERTY(QColor inputText MEMBER inputText NOTIFY themeColorChanged)
    Q_PROPERTY(QColor inputBorder MEMBER inputBorder NOTIFY themeColorChanged)

    // Button
    Q_PROPERTY(QColor buttonBorder MEMBER buttonBorder NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonBorderInside MEMBER buttonBorderInside NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonText MEMBER buttonText NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonBackStart MEMBER buttonBackStart NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonBackEnd MEMBER buttonBackEnd NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonBorderDown MEMBER buttonBorderDown NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonBorderInsideDown MEMBER buttonBorderInsideDown NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonTextDown MEMBER buttonTextDown NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonBackStartDown MEMBER buttonBackStartDown NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonBackEndDown MEMBER buttonBackEndDown NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonBorderFocus MEMBER buttonBorderFocus NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonBorderInsideFocus MEMBER buttonBorderInsideFocus NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonTextFocus MEMBER buttonTextFocus NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonBackStartFocus MEMBER buttonBackStartFocus NOTIFY themeColorChanged)
    Q_PROPERTY(QColor buttonBackEndFocus MEMBER buttonBackEndFocus NOTIFY themeColorChanged)

    // Checkboxes
    Q_PROPERTY(QColor checkboxCheckedTick MEMBER checkboxCheckedTick NOTIFY themeColorChanged)
    Q_PROPERTY(QColor checkboxPartiallyCheckedTick MEMBER checkboxPartiallyCheckedTick NOTIFY themeColorChanged)
    Q_PROPERTY(QColor checkboxCheckedBorderInset MEMBER checkboxCheckedBorderInset NOTIFY themeColorChanged)
    Q_PROPERTY(QColor checkboxPartiallyCheckedBorderInset MEMBER checkboxPartiallyCheckedBorderInset NOTIFY themeColorChanged)

    // Switches
    Q_PROPERTY(QColor switchNubBorder MEMBER switchNubBorder NOTIFY themeColorChanged)
    Q_PROPERTY(QColor switchNubBorderInside MEMBER switchNubBorderInside NOTIFY themeColorChanged)
    Q_PROPERTY(QColor switchNubBackStart MEMBER switchNubBackStart NOTIFY themeColorChanged)
    Q_PROPERTY(QColor switchNubBackEnd MEMBER switchNubBackEnd NOTIFY themeColorChanged)
    Q_PROPERTY(QColor switchTrackBorder MEMBER switchTrackBorder NOTIFY themeColorChanged)
    Q_PROPERTY(QColor switchTrackStart MEMBER switchTrackStart NOTIFY themeColorChanged)
    Q_PROPERTY(QColor switchTrackEnd MEMBER switchTrackEnd NOTIFY themeColorChanged)
    Q_PROPERTY(QColor switchTrackBorderSelected MEMBER switchTrackBorderSelected NOTIFY themeColorChanged)
    Q_PROPERTY(QColor switchTrackStartSelected MEMBER switchTrackStartSelected NOTIFY themeColorChanged)
    Q_PROPERTY(QColor switchTrackEndSelected MEMBER switchTrackEndSelected NOTIFY themeColorChanged)

    QML_ELEMENT

signals:
    void themeColorChanged();

public:
    // Window
    QColor windowBackground;
    QColor windowText;
    QColor viewportBackground;

    // Sidebar
    QColor sidebarBackground;
    QColor sidebarBorder;

    // Toolbar
    QColor toolbarBackStart;
    QColor toolbarBackEnd;
    QColor toolbarBorder;

    // Input (textboxes)
    QColor inputBackground;
    QColor inputText;
    QColor inputBorder;

    // Button
    QColor buttonBorder;
    QColor buttonBorderInside;
    QColor buttonText;
    QColor buttonBackStart;
    QColor buttonBackEnd;
    QColor buttonBorderDown;
    QColor buttonBorderInsideDown;
    QColor buttonTextDown;
    QColor buttonBackStartDown;
    QColor buttonBackEndDown;
    QColor buttonBorderFocus;
    QColor buttonBorderInsideFocus;
    QColor buttonTextFocus;
    QColor buttonBackStartFocus;
    QColor buttonBackEndFocus;

    QColor checkboxCheckedTick;
    QColor checkboxPartiallyCheckedTick;
    QColor checkboxCheckedBorderInset;
    QColor checkboxPartiallyCheckedBorderInset;


    QColor switchNubBorder;
    QColor switchNubBorderInside;
    QColor switchNubBackStart;
    QColor switchNubBackEnd;
    QColor switchTrackBorder;
    QColor switchTrackStart;
    QColor switchTrackEnd;
    QColor switchTrackBorderSelected;
    QColor switchTrackStartSelected;
    QColor switchTrackEndSelected;
};

#endif // THEMECOLORS_H
