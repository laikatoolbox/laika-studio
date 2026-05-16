#ifndef THEMECOLORS_H
#define THEMECOLORS_H

#include <QObject>
#include <QColor>
#include <QtQmlIntegration>

class ThemeColors : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QColor windowBackground MEMBER windowBackground)
    Q_PROPERTY(QColor windowText MEMBER windowText)
    Q_PROPERTY(QColor viewportBackground MEMBER viewportBackground)
    Q_PROPERTY(QColor inputBackground MEMBER inputBackground)
    Q_PROPERTY(QColor inputText MEMBER inputText)
    Q_PROPERTY(QColor inputBorder MEMBER inputBorder)
    Q_PROPERTY(QColor buttonBorder MEMBER buttonBorder)
    Q_PROPERTY(QColor buttonBorderInside MEMBER buttonBorderInside)
    Q_PROPERTY(QColor buttonText MEMBER buttonText)
    Q_PROPERTY(QColor buttonBackStart MEMBER buttonBackStart)
    Q_PROPERTY(QColor buttonBackEnd MEMBER buttonBackEnd)
    Q_PROPERTY(QColor buttonBorderDown MEMBER buttonBorderDown)
    Q_PROPERTY(QColor buttonBorderInsideDown MEMBER buttonBorderInsideDown)
    Q_PROPERTY(QColor buttonTextDown MEMBER buttonTextDown)
    Q_PROPERTY(QColor buttonBackStartDown MEMBER buttonBackStartDown)
    Q_PROPERTY(QColor buttonBackEndDown MEMBER buttonBackEndDown)
    Q_PROPERTY(QColor buttonBorderFocus MEMBER buttonBorderFocus)
    Q_PROPERTY(QColor buttonBorderInsideFocus MEMBER buttonBorderInsideFocus)
    Q_PROPERTY(QColor buttonTextFocus MEMBER buttonTextFocus)
    Q_PROPERTY(QColor buttonBackStartFocus MEMBER buttonBackStartFocus)
    Q_PROPERTY(QColor buttonBackEndFocus MEMBER buttonBackEndFocus)

    QML_ELEMENT

public:
    // Window
    QColor windowBackground;
    QColor windowText;
    QColor viewportBackground;

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
};

#endif // THEMECOLORS_H
