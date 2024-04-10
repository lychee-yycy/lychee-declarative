import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Lychee.impl

T.PageIndicator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    delegate: Image {
        source: Lychee.url + "pageindicator-delegate"
        ImageSelector on source {
            states: [
                {"light": Qt.styleHints.colorScheme === Qt.Light},
                {"dark": Qt.styleHints.colorScheme === Qt.Dark},
                {"current": index === control.currentIndex},
            ]
        }
        opacity: control.enabled ? 1 : 0.5
    }

    contentItem: Row {
        spacing: 10

        Repeater {
            model: control.count
            delegate: control.delegate
        }
    }
}
