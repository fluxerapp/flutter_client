package com.fluxer

import android.media.AudioDeviceInfo
import android.telecom.CallAudioState
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class VoiceSpeakerRouteTest {
    @Test
    fun parsesRouteNames() {
        assertEquals(VoiceOutputRoute.Speaker, voiceOutputRouteFromName("speaker"))
        assertEquals(VoiceOutputRoute.Earpiece, voiceOutputRouteFromName("earpiece"))
        assertEquals(VoiceOutputRoute.Headset, voiceOutputRouteFromName("headset"))
        assertEquals(VoiceOutputRoute.Bluetooth, voiceOutputRouteFromName("bluetooth"))
        assertEquals(VoiceOutputRoute.Speaker, voiceOutputRouteFromName(null))
    }

    @Test
    fun speakerRouteKeepsSpeakerphoneOn() {
        assertTrue(speakerphoneOnForRoute(VoiceOutputRoute.Speaker))
        assertFalse(speakerphoneOnForRoute(VoiceOutputRoute.Earpiece))
        assertFalse(speakerphoneOnForRoute(VoiceOutputRoute.Headset))
        assertFalse(speakerphoneOnForRoute(VoiceOutputRoute.Bluetooth))
    }

    @Test
    fun onlySamsungPinsSpeakerWithCommunicationDevice() {
        assertTrue(routesSpeakerWithCommunicationDevice("samsung"))
        assertTrue(routesSpeakerWithCommunicationDevice("Samsung", "samsung"))
        assertTrue(routesSpeakerWithCommunicationDevice("Google", "samsung"))
        assertFalse(routesSpeakerWithCommunicationDevice("Google"))
        assertFalse(routesSpeakerWithCommunicationDevice("Xiaomi"))
        assertFalse(routesSpeakerWithCommunicationDevice("OnePlus"))
        assertFalse(routesSpeakerWithCommunicationDevice(null))
    }

    @Test
    fun onlySamsungKeepsRecheckingTheRoute() {
        assertEquals(listOf(400L, 1000L, 2500L, 5000L), routeFollowUpDelaysMs("samsung"))
        assertEquals(listOf(400L, 1000L, 2500L, 5000L), routeFollowUpDelaysMs("Google", "samsung"))
        assertEquals(listOf(400L), routeFollowUpDelaysMs("Google"))
        assertEquals(listOf(400L), routeFollowUpDelaysMs(null))
    }

    @Test
    fun mapsVoiceOutputRoutesToTelecomRoutes() {
        assertEquals(
            CallAudioState.ROUTE_SPEAKER,
            telecomRouteForVoiceOutput(VoiceOutputRoute.Speaker),
        )
        assertEquals(
            CallAudioState.ROUTE_EARPIECE,
            telecomRouteForVoiceOutput(VoiceOutputRoute.Earpiece),
        )
        assertEquals(
            CallAudioState.ROUTE_BLUETOOTH,
            telecomRouteForVoiceOutput(VoiceOutputRoute.Bluetooth),
        )
        assertEquals(
            CallAudioState.ROUTE_WIRED_HEADSET,
            telecomRouteForVoiceOutput(VoiceOutputRoute.Headset),
        )
    }

    @Test
    fun skipsTelecomRequestForAnUnsupportedRoute() {
        val phoneOnly = CallAudioState.ROUTE_SPEAKER or CallAudioState.ROUTE_EARPIECE
        assertFalse(
            telecomRouteRequestNeeded(
                target = CallAudioState.ROUTE_BLUETOOTH,
                currentRoute = CallAudioState.ROUTE_SPEAKER,
                supportedRouteMask = phoneOnly,
                force = true,
            ),
        )
    }

    @Test
    fun requestsTelecomRouteWhenItDiffersOrIsForced() {
        val mask = CallAudioState.ROUTE_SPEAKER or CallAudioState.ROUTE_BLUETOOTH
        assertTrue(
            telecomRouteRequestNeeded(
                target = CallAudioState.ROUTE_BLUETOOTH,
                currentRoute = CallAudioState.ROUTE_SPEAKER,
                supportedRouteMask = mask,
                force = false,
            ),
        )
        assertFalse(
            telecomRouteRequestNeeded(
                target = CallAudioState.ROUTE_BLUETOOTH,
                currentRoute = CallAudioState.ROUTE_BLUETOOTH,
                supportedRouteMask = mask,
                force = false,
            ),
        )
        assertTrue(
            telecomRouteRequestNeeded(
                target = CallAudioState.ROUTE_BLUETOOTH,
                currentRoute = CallAudioState.ROUTE_BLUETOOTH,
                supportedRouteMask = mask,
                force = true,
            ),
        )
        assertTrue(
            telecomRouteRequestNeeded(
                target = CallAudioState.ROUTE_BLUETOOTH,
                currentRoute = null,
                supportedRouteMask = null,
                force = false,
            ),
        )
    }

    @Test
    fun listsBluetoothAndWiredRoutesSeparatelyAndHidesEarpieceWhenWired() {
        assertEquals(
            listOf("speaker", "earpiece", "bluetooth"),
            availableVoiceOutputRouteNames(
                outputTypes = setOf(
                    AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
                    AudioDeviceInfo.TYPE_BUILTIN_EARPIECE,
                    AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
                ),
                hasEarpiece = false,
            ),
        )
        assertEquals(
            listOf("speaker", "headset", "bluetooth"),
            availableVoiceOutputRouteNames(
                outputTypes = setOf(
                    AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
                    AudioDeviceInfo.TYPE_BUILTIN_EARPIECE,
                    AudioDeviceInfo.TYPE_WIRED_HEADSET,
                    AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
                ),
                hasEarpiece = true,
            ),
        )
    }

    @Test
    fun listsBluetoothForBleAndHearingAidOutputs() {
        for (type in listOf(
            AudioDeviceInfo.TYPE_BLE_HEADSET,
            AudioDeviceInfo.TYPE_BLE_SPEAKER,
            AudioDeviceInfo.TYPE_HEARING_AID,
        )) {
            assertEquals(
                listOf("speaker", "bluetooth"),
                availableVoiceOutputRouteNames(
                    outputTypes = setOf(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER, type),
                    hasEarpiece = false,
                ),
            )
        }
    }

    @Test
    fun omitsHeadsetWhenOnlyBuiltinOutputsExist() {
        assertEquals(
            listOf("speaker", "earpiece"),
            availableVoiceOutputRouteNames(
                outputTypes = setOf(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER),
                hasEarpiece = true,
            ),
        )
        assertNull(communicationDeviceForRoute(VoiceOutputRoute.Headset, emptyList()))
        assertNull(communicationDeviceForRoute(VoiceOutputRoute.Bluetooth, emptyList()))
    }

    @Test
    fun bluetoothRoutePrefersScoOverA2dp() {
        assertEquals(
            AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
            communicationDeviceTypeForRoute(
                VoiceOutputRoute.Bluetooth,
                listOf(
                    AudioDeviceInfo.TYPE_BLUETOOTH_A2DP,
                    AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
                ),
            ),
        )
    }

    @Test
    fun bluetoothRouteDoesNotSelectA2dpOnly() {
        assertNull(
            communicationDeviceTypeForRoute(
                VoiceOutputRoute.Bluetooth,
                listOf(AudioDeviceInfo.TYPE_BLUETOOTH_A2DP),
            ),
        )
    }

    @Test
    fun wiredAndBluetoothRoutesSelectTheirOwnDevices() {
        val types = listOf(
            AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
            AudioDeviceInfo.TYPE_WIRED_HEADSET,
        )
        assertEquals(
            AudioDeviceInfo.TYPE_WIRED_HEADSET,
            communicationDeviceTypeForRoute(VoiceOutputRoute.Headset, types),
        )
        assertEquals(
            AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
            communicationDeviceTypeForRoute(VoiceOutputRoute.Bluetooth, types),
        )
    }

    @Test
    fun speakerRouteStaysSpeakerWhenHeadsetTypesExist() {
        assertEquals(
            AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
            communicationDeviceTypeForRoute(
                VoiceOutputRoute.Speaker,
                listOf(
                    AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
                    AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
                ),
            ),
        )
    }

    @Test
    fun omitsHeadsetWhenOnlyA2dpOutputExists() {
        assertEquals(
            listOf("speaker", "earpiece"),
            availableVoiceOutputRouteNames(
                outputTypes = setOf(
                    AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
                    AudioDeviceInfo.TYPE_BUILTIN_EARPIECE,
                    AudioDeviceInfo.TYPE_BLUETOOTH_A2DP,
                ),
                hasEarpiece = false,
            ),
        )
    }

    @Test
    fun bluetoothAddressesMatchExactlyOrByAnonymizedSuffix() {
        assertTrue(bluetoothAddressesMatch("AA:BB:CC:DD:EE:FF", "aa:bb:cc:dd:ee:ff"))
        assertTrue(bluetoothAddressesMatch("XX:XX:XX:XX:EE:FF", "AA:BB:CC:DD:EE:FF"))
        assertFalse(bluetoothAddressesMatch("AA:BB:CC:DD:EE:FF", "11:22:33:44:EE:FF"))
        assertFalse(bluetoothAddressesMatch("XX:XX:XX:XX:EE:FF", "AA:BB:CC:DD:EE:00"))
        assertFalse(bluetoothAddressesMatch(null, "AA:BB:CC:DD:EE:FF"))
    }

    @Test
    fun deviceKindsMapToTheirRoutes() {
        assertEquals(
            VoiceOutputDeviceKind.BluetoothLe,
            voiceOutputDeviceKind(AudioDeviceInfo.TYPE_BLE_SPEAKER),
        )
        assertEquals(VoiceOutputRoute.Headset, VoiceOutputDeviceKind.Usb.route)
        assertEquals(VoiceOutputRoute.Bluetooth, VoiceOutputDeviceKind.HearingAid.route)
        assertNull(voiceOutputDeviceKind(AudioDeviceInfo.TYPE_BLUETOOTH_A2DP))
    }
}
