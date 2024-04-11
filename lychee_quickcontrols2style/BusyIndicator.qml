import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.Lychee.impl
import QtQuick.Controls.impl

T.BusyIndicator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topPadding: background ? background.topPadding : 0
    leftPadding: background ? background.leftPadding : 0
    rightPadding: background ? background.rightPadding : 0
    bottomPadding: background ? background.bottomPadding : 0

    topInset: background ? -background.topInset || 0 : 0
    leftInset: background ? -background.leftInset || 0 : 0
    rightInset: background ? -background.rightInset || 0 : 0
    bottomInset: background ? -background.bottomInset || 0 : 0

    contentItem: Image {
        property int currentImage: 8
        source: Lychee.url + "busyindicator-frame-0" + currentImage +
                (Qt.styleHints.colorScheme === Qt.Light ? "-light.png" : "-dark.png")
        fillMode: Image.PreserveAspectFit
        NumberAnimation on currentImage {
            running: control.visible && control.running
            loops: -1
            from: 8
            to: 1
            duration: 800
        }
    }
}

