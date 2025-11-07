/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

// Custom builds can override this file to add custom guided actions.

import QtQml

QtObject {
    readonly property int actionCustomButton: _guidedController.customActionStart + 0

    readonly property string customButtonTitle: qsTr("Avoid")

    readonly property string customButtonMessage: qsTr("Placeholder for avoiding other aircraft.")

    function customConfirmAction(actionCode, actionData, mapIndicator, confirmDialog) {
        switch (actionCode) {
        case actionCustomButton:
            confirmDialog.hideTrigger = true
            confirmDialog.title = customButtonTitle
            confirmDialog.message = customButtonMessage
            break
        default:
            return false // false = action not handled here
        }

        return true // true = action handled here
    }

    function customExecuteAction(actionCode, actionData, sliderOutputValue, optionCheckedode) {
        switch (actionCode) {
        case actionCustomButton:
            mainWindow.showMessageDialog("Avoid", "Avoid other aircaft.")
            break
        default:
            return false // false = action not handled here
        }

        return true // true = action handled here
    }
}