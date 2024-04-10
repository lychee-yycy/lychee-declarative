set(qml_files
    "CursorDelegate.qml"
    "DialogButtonBoxDelegate.qml"
)

qt_add_qml_module(QuickControls2LycheeStyleImpl
    URI "QtQuick.Controls.Lychee.impl"
    VERSION 1.0
    PLUGIN_TARGET qtquickcontrols2lycheestyleimplplugin
    SOURCES
        qquicklycheestyle.cpp qquicklycheestyle_p.h
        qquicklycheecursorflashtimer_p.h qquicklycheecursorflashtimer.cpp
    QML_FILES
        ${qml_files}
)

target_link_libraries(QuickControls2LycheeStyleImpl PUBLIC
    Qt6::CorePrivate
    Qt6::Gui
    Qt6::QmlPrivate
    Qt6::QuickPrivate
)
