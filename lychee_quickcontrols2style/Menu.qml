import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Lychee.impl

T.Menu {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    delegate: MenuItem {}

    margins: 0
    cascade: true
    dim: modal || control.parent && control.parent.menu
    overlap: control.width

    enter: Transition {
        NumberAnimation { property: "scale"; from: 0.2; to: 1.0; easing.type: Easing.OutQuint; duration: 220 }
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutCubic; duration: 150 }
    }

    exit: Transition {
        NumberAnimation { property: "scale"; from: 1.0; to: 0.0; easing.type: Easing.OutQuint; duration: 220 }
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.OutCubic; duration: 150 }
    }

    contentItem: ListView {
        implicitHeight: contentHeight
        model: control.contentModel
        interactive: Window.window
                     ? contentHeight + control.topPadding + control.bottomPadding > control.height
                     : false
        clip: true
        currentIndex: control.currentIndex

        T.ScrollIndicator.vertical: ScrollIndicator { }
    }

    background: Item {
        implicitHeight: 44
        implicitWidth: 250
        NinePatchImage {
            width: parent.width
            height: parent.height
            source: Lychee.url + "menu-background"
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
