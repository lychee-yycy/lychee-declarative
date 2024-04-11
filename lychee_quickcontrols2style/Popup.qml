import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Lychee.impl

T.Popup {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    topPadding: 23
    padding: 16

    enter: Transition {
        NumberAnimation { property: "scale"; from: 1.5; to: 1.0; easing.type: Easing.OutQuint; duration: 220 }
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutCubic; duration: 150 }
    }

    exit: Transition {
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.OutCubic; duration: 150 }
    }

    background: Item {
        implicitWidth: 270
        implicitHeight: 140
        NinePatchImage {
            width: parent.width
            height: parent.height
            source: Lychee.url + "popup-background"
            NinePatchImageSelector on source {
                states: [
                    {"light": Qt.styleHints.colorScheme === Qt.Light},
                    {"dark": Qt.styleHints.colorScheme === Qt.Dark}
                ]
            }
        }
    }

    T.Overlay.modal: Rectangle {
        color: Color.transparent("black", 0.5)
        Behavior on opacity { NumberAnimation { duration: 150 } }
    }

    T.Overlay.modeless: Rectangle {
        color: Color.transparent("black", 0.5)
        Behavior on opacity { NumberAnimation { duration: 150 } }
    }
}
