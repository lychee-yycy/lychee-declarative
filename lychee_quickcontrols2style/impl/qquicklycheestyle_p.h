#ifndef QQUICKLYCHEESTYLE_P_H
#define QQUICKLYCHEESTYLE_P_H

#include <QtCore/qobject.h>
#include <QtQml/qqml.h>

QT_BEGIN_NAMESPACE

class QQuickLycheeStyle : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QUrl url READ url CONSTANT FINAL)
    QML_NAMED_ELEMENT(Lychee)
    QML_SINGLETON
    QML_ADDED_IN_VERSION(6, 5)

public:
    explicit QQuickLycheeStyle(QObject *parent = nullptr);

    static QUrl url();
};

QT_END_NAMESPACE

#endif // QQUICKLYCHEESTYLE_P_H
