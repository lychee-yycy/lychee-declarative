#include "qquicklycheetheme_p.h"

#include <QtCore/qloggingcategory.h>
#include <QtQml/qqml.h>
#include <QtQuickControls2/private/qquickstyleplugin_p.h>
#include <QtQuickTemplates2/private/qquicktheme_p.h>

QT_BEGIN_NAMESPACE

extern void qml_register_types_QtQuick_Controls_Lychee();
Q_GHS_KEEP_REFERENCE(qml_register_types_QtQuick_Controls_Lychee);

class QtQuickControls2LycheeStylePlugin : public QQuickStylePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    QtQuickControls2LycheeStylePlugin(QObject *parent = nullptr);

    QString name() const override;
    void initializeTheme(QQuickTheme *theme) override;
    void updateTheme() override;

    QQuickLycheTheme m_theme;
};

QtQuickControls2LycheeStylePlugin::QtQuickControls2LycheeStylePlugin(QObject *parent) : QQuickStylePlugin(parent)
{
    volatile auto registration = &qml_register_types_QtQuick_Controls_Lychee;
    Q_UNUSED(registration);
}

QString QtQuickControls2LycheeStylePlugin::name() const
{
    return QStringLiteral("Lychee");
}

void QtQuickControls2LycheeStylePlugin::initializeTheme(QQuickTheme *theme)
{
    m_theme.initialize(theme);
}

void QtQuickControls2LycheeStylePlugin::updateTheme()
{
    QQuickTheme *theme = QQuickTheme::instance();
    m_theme.initialize(theme);
}

QT_END_NAMESPACE

#include "qtquickcontrols2lycheestyleplugin.moc"
