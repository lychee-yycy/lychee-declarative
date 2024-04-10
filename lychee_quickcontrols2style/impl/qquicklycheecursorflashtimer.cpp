// Copyright (C) 2022 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

#include "qquicklycheecursorflashtimer_p.h"
#include <QtGui/qguiapplication.h>
#include <QtGui/qstylehints.h>

QT_BEGIN_NAMESPACE

QQuickLycheeCursorFlashTimer::QQuickLycheeCursorFlashTimer(QObject *parent)
    : QObject(parent)
{
}

bool QQuickLycheeCursorFlashTimer::visible() const
{
    return m_visible;
}

void QQuickLycheeCursorFlashTimer::setVisible(bool visible)
{
    if (m_visible == visible)
        return;
    m_visible = visible;
    emit visibleChanged();
}

int QQuickLycheeCursorFlashTimer::cursorPosition() const
{
    return m_cursorPosition;
}

void QQuickLycheeCursorFlashTimer::setCursorPosition(int cursorPosition)
{
    if (m_cursorPosition == cursorPosition)
        return;
    m_cursorPosition = cursorPosition;
    emit cursorPositionChanged();
    start();
}

bool QQuickLycheeCursorFlashTimer::running() const
{
    return m_running;
}

void QQuickLycheeCursorFlashTimer::setRunning(bool running)
{
    if (running == m_running)
        return;
    m_running = running;
    emit runningChanged(m_running);
    if (!running) {
        stop();
        setVisible(false);
    } else {
        start();
    }
}

void QQuickLycheeCursorFlashTimer::start()
{
    stop();
    m_timer = startTimer(QGuiApplication::styleHints()->cursorFlashTime() / 2);
}

void QQuickLycheeCursorFlashTimer::stop()
{
    killTimer(m_timer);
    m_timer = 0;
}

void QQuickLycheeCursorFlashTimer::timerEvent(QTimerEvent *event)
{
    if (event->timerId() == m_timer)
        setVisible(!visible());
}

QT_END_NAMESPACE
