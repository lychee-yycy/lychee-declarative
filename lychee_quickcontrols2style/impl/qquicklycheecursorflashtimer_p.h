#ifndef QQUICKLYCHEECURSORFLASHTIMER_P_H
#define QQUICKLYCHEECURSORFLASHTIMER_P_H

#include <QtQml/qqml.h>
#include <QtCore/qobject.h>

QT_BEGIN_NAMESPACE

class QQuickLycheeCursorFlashTimer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool visible READ visible WRITE setVisible NOTIFY visibleChanged FINAL)
    Q_PROPERTY(int cursorPosition READ cursorPosition WRITE setCursorPosition NOTIFY cursorPositionChanged FINAL)
    Q_PROPERTY(bool running READ running WRITE setRunning NOTIFY runningChanged FINAL)
    QML_NAMED_ELEMENT(CursorFlashTimer)

public:
    explicit QQuickLycheeCursorFlashTimer(QObject *parent = nullptr);

    bool visible() const;
    void setVisible(bool visible);

    int cursorPosition() const;
    void setCursorPosition(int cursorPosition);

    bool running() const;
    void setRunning(bool running);

    void start();
    void stop();

    void timerEvent(QTimerEvent *event) override;

Q_SIGNALS:
    void visibleChanged();
    void cursorPositionChanged();
    void runningChanged(bool running);

private:
    bool m_visible = false;
    int m_cursorPosition = 0;
    int m_timer = 0;
    bool m_running = false;
};

QT_END_NAMESPACE

#endif // QQUICKLYCHEECURSORFLASHTIMER_P_H
