cmake_minimum_required(VERSION 3.16)
project(lychee_style LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Core Gui Quick QuickControls2)

set(qml_files
    "Slider.qml"
    "RangeSlider.qml"
    "Switch.qml"
    "Button.qml"
    "CheckBox.qml"
    "RadioButton.qml"
    "SpinBox.qml"
    "ProgressBar.qml"
    "Dial.qml"
    "PageIndicator.qml"
    "TextArea.qml"
    "TextField.qml"
    "ScrollIndicator.qml"
    "ItemDelegate.qml"
    "SwitchDelegate.qml"
    "RadioDelegate.qml"
    "CheckDelegate.qml"
    "SwipeDelegate.qml"
    "StackView.qml"
    "TreeViewDelegate.qml"
    "ScrollBar.qml"
    "TabButton.qml"
    "ToolButton.qml"
    "MenuBarItem.qml"
    "Frame.qml"
    "GroupBox.qml"
    "SplitView.qml"
    "TabBar.qml"
    "ToolBar.qml"
    "MenuBar.qml"
    "Drawer.qml"
    "Popup.qml"
    "Menu.qml"
    "MenuItem.qml"
    "MenuSeparator.qml"
    "BusyIndicator.qml"
    "ComboBox.qml"
    "HorizontalHeaderView.qml"
    "VerticalHeaderView.qml"
    "Dialog.qml"
    "DialogButtonBox.qml"
    "DelayButton.qml"
    "SelectionRectangle.qml"
    "ToolTip.qml"
    "ToolSeparator.qml"
)

find_package(Qt6 6.4 REQUIRED COMPONENTS Core Gui Quick QuickControls2)

file(GLOB resource_glob RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "images/*.png")
foreach(file IN LISTS resource_glob_0)
    set_source_files_properties("${CMAKE_CURRENT_SOURCE_DIR}/${file}" PROPERTIES QT_RESOURCE_ALIAS "${file}")
endforeach()

set(qmake_QtQuickControls2LycheeStylePlugin_resource_files
    ${resource_glob}
)

qt_add_qml_module(qtquickcontrols2lycheestyleplugin
    URI flatstyle
    VERSION 1.0
    PLUGIN_TARGET QtQuickControls2LycheeStylePlugin
    SOURCES
        qtquickcontrols2lycheestyleplugin.cpp
    QML_FILES ${qml_files}
    RESOURCES ${qmake_QtQuickControls2LycheeStylePlugin_resource_files}
)

target_link_libraries(qtquickcontrols2lycheestyleplugin PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Quick
    Qt6::QuickControls2
    Qt6::QuickControls2Private
    Qt6::QuickTemplates2Private
)

add_subdirectory(impl)
qt_import_qml_plugins(qtquickcontrols2lycheestyleplugin)
