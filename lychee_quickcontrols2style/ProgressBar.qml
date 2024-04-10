import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Lychee.impl

T.ProgressBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    opacity: control.enabled ? 1 : 0.5

    contentItem: Item {
        parent: control.background
        implicitWidth: control.indeterminate ? animatedProgress.implicitWidth : progress.implicitWidth
        implicitHeight: control.indeterminate ? animatedProgress.implicitHeight : progress.implicitHeight
        scale: control.mirrored ? -1 : 1

        readonly property NinePatchImage progress: NinePatchImage {
            parent: control.contentItem
            visible: !control.indeterminate && control.value
            y: (parent.height - height) / 2
            width: control.position * parent.width

            source: Lychee.url + "slider-progress"
            NinePatchImageSelector on source {
                states: [
                    {"light": Qt.styleHints.colorScheme === Qt.Light},
                    {"dark": Qt.styleHints.colorScheme === Qt.Dark}
                ]
            }
        }

        readonly property NinePatchImage animatedProgress: NinePatchImage {
            parent: control.contentItem
            visible: control.indeterminate
            y: (parent.height - height) / 2
            width: control.width * 0.4

            source: Lychee.url + "slider-progress"
            NinePatchImageSelector on source {
                states: [
                    {"light": Qt.styleHints.colorScheme === Qt.Light},
                    {"dark": Qt.styleHints.colorScheme === Qt.Dark}
                ]
            }

            NumberAnimation on x {
                running: control.indeterminate && control.visible
                from: -control.contentItem.progress.width
                to: control.width
                duration: 900
                easing.type: Easing.Linear
                loops: Animation.Infinite
            }
        }
    }

    background: Item {
        implicitWidth: 150
        implicitHeight: children[0].implicitHeight
        clip: control.indeterminate
        NinePatchImage {
            source: Lychee.url + "slider-background"
            y: (parent.height - height) / 2
            width: control.background.width
            NinePatchImageSelector on source {
                states: [
                    {"light": Qt.styleHints.colorScheme === Qt.Light},
                    {"dark": Qt.styleHints.colorScheme === Qt.Dark}
                ]
            }
        }
    }
}
