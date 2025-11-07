/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQml.Models

import QGroundControl
import QGroundControl.Controls

ToolStripActionList {
    id: _root

    signal displayPreFlightChecklist

    model: [
        PreFlightCheckListShowAction { onTriggered: displayPreFlightChecklist() },
        GuidedActionTakeoff { },
        GuidedActionLand { },
        GuidedActionRTL { },
        GuidedActionPause { },
        GuidedToolStripAction {
            property var   activeVehicle:           QGroundControl.multiVehicleManager.activeVehicle 
            property bool  _initialConnectComplete: activeVehicle ? activeVehicle.initialConnectComplete : false
            property bool  _grip_enable:            _initialConnectComplete ? activeVehicle.hasGripper : false
            property bool  _isVehicleArmed:         _initialConnectComplete ? activeVehicle.armed : false

            text:       "Payload"
            iconSource: "/res/payload-drop-white.svg"          
            visible:    !_isVehicleArmed && _grip_enable   // in this way if the pilot it's on the ground can release the cargo without actions tool
            enabled:    _grip_enable
            actionID:   _guidedController.actionGripper
        },

        GuidedToolStripAction {
            text:       _guidedController._customController.customButtonTitle
            iconSource: "/res/shield-airplane-white.svg"
            visible:    true
            enabled:    true
            actionID:   _guidedController._customController.actionCustomButton
        },
        FlyViewAdditionalActionsButton { }
    ]
}
