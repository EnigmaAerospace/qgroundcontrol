/****************************************************************************
 *
 *   (c) 2009-2016 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick
import QtQuick.Controls
import QtQml.Models

import QGroundControl
import QGroundControl.ScreenTools
import QGroundControl.Controls
import QGroundControl.FlightDisplay
import QGroundControl.Vehicle

Item {
    property var model: listModel
    PreFlightCheckModel {
        id:     listModel
        PreFlightCheckGroup {
            name: qsTr("Phoenix Aircraft Initial Checks")

            PreFlightCheckButton {
                name:           qsTr("Hardware")
                manualText:     qsTr("Ensure that all hardware is properly mounted and secure.")
            }

            PreFlightBatteryCheck {
                failurePercent:                 40
                allowFailurePercentOverride:    false
            }

            PreFlightSensorsHealthCheck {
            }

            PreFlightGPSCheck {
                failureSatCount:        9
                allowOverrideSatCount:  true
            }

            PreFlightRCCheck {
            }
        }

        PreFlightCheckGroup {
            name: qsTr("Arm the vehicle and perform the following checks")

            PreFlightCheckButton {
                name:            qsTr("Actuators")
                manualText:      qsTr("Move all control surfaces. Did they work properly?")
            }

            PreFlightCheckButton {
                name:            qsTr("Motors")
                manualText:      qsTr("Propellers free? Then throttle up gently. Working properly?")
            }

            PreFlightCheckButton {
                name:           qsTr("Mission")
                manualText:     qsTr("Please confirm mission is valid (waypoints valid, no terrain collision).")
            }

            PreFlightSoundCheck {
            }
        }

        PreFlightCheckGroup {
            name: qsTr("Final preparations before launch")

            // Check list item group 2 - Final checks before launch
            PreFlightCheckButton {
                name:           qsTr("Payload")
                manualText:     qsTr("Ensure that the payload is secure.")
            }

            PreFlightCheckButton {
                name:           qsTr("Wind & weather")
                manualText:     qsTr("Check wind speed and weather conditions are suitable for flight.")
            }

            PreFlightCheckButton {
                name:           qsTr("Flight area")
                manualText:     qsTr("Ensure that launch area and path free of obstacles/people.")
            }
        }
    }
}

