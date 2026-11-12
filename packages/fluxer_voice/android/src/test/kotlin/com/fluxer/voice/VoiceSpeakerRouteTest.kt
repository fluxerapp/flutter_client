package com.fluxer.voice

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
    fun fallbackKeepsTheDesiredRouteWhenAvailable() {
        assertEquals(
            VoiceOutputRoute.Earpiece,
            voiceRouteSearchOrder(VoiceOutputRoute.Earpiece, VoiceOutputRoute.Speaker, listOf("speaker", "earpiece", "bluetooth")).first(),
        )
    }

    @Test
    fun fallbackPrefersBluetoothThenHeadsetThenSpeaker() {
        assertEquals(
            VoiceOutputRoute.Bluetooth,
            voiceRouteSearchOrder(VoiceOutputRoute.Headset, VoiceOutputRoute.Speaker, listOf("speaker", "earpiece", "bluetooth")).first(),
        )
        assertEquals(
            VoiceOutputRoute.Headset,
            voiceRouteSearchOrder(VoiceOutputRoute.Earpiece, VoiceOutputRoute.Speaker, listOf("speaker", "headset")).first(),
        )
        assertEquals(
            VoiceOutputRoute.Speaker,
            voiceRouteSearchOrder(VoiceOutputRoute.Bluetooth, VoiceOutputRoute.Speaker, listOf("speaker", "earpiece")).first(),
        )
    }

    @Test
    fun searchOrderFallsBackToTheBuiltInDefaultAndSkipsFailedRoutes() {
        assertEquals(
            listOf(VoiceOutputRoute.Earpiece, VoiceOutputRoute.Speaker),
            voiceRouteSearchOrder(VoiceOutputRoute.Bluetooth, VoiceOutputRoute.Earpiece, listOf("speaker", "earpiece")),
        )
        assertEquals(
            listOf(VoiceOutputRoute.Speaker, VoiceOutputRoute.Earpiece),
            voiceRouteSearchOrder(
                VoiceOutputRoute.Bluetooth,
                VoiceOutputRoute.Speaker,
                listOf("speaker", "earpiece", "bluetooth"),
                unavailable = setOf(VoiceOutputRoute.Bluetooth),
            ),
        )
    }

    @Test
    fun mapsTelecomRoutesBack() {
        assertEquals(VoiceOutputRoute.Bluetooth, voiceOutputRouteForTelecom(CallAudioState.ROUTE_BLUETOOTH))
        assertEquals(VoiceOutputRoute.Earpiece, voiceOutputRouteForTelecom(CallAudioState.ROUTE_EARPIECE))
        assertNull(voiceOutputRouteForTelecom(CallAudioState.ROUTE_STREAMING))
    }

    @Test
    fun reassertLimiterReportsWhenTheNextSlotOpens() {
        val limiter = ReassertLimiter(maxCount = 2, windowMs = 1000)
        assertEquals(0, limiter.millisUntilNextSlot(0))
        limiter.tryAcquire(100)
        limiter.tryAcquire(200)
        assertEquals(400, limiter.millisUntilNextSlot(700))
    }

    @Test
    fun reassertLimiterCapsAttemptsWithinTheWindow() {
        val limiter = ReassertLimiter(maxCount = 2, windowMs = 1000)
        assertTrue(limiter.tryAcquire(0))
        assertTrue(limiter.tryAcquire(100))
        assertFalse(limiter.tryAcquire(200))
        assertTrue(limiter.tryAcquire(1000))
        limiter.reset()
        assertTrue(limiter.tryAcquire(1001))
    }

    @Test
    fun eventLogKeepsTheMostRecentEntries() {
        var now = 0L
        val log = VoiceRouteEventLog(capacity = 2) { now }
        log.add("a")
        now = 5
        log.add("b")
        log.add("c")
        assertEquals(listOf("+5ms b", "+5ms c"), log.snapshot())
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
        assertTrue(communicationDeviceCandidates(VoiceOutputRoute.Headset, emptyList()).isEmpty())
        assertTrue(communicationDeviceCandidates(VoiceOutputRoute.Bluetooth, emptyList()).isEmpty())
    }

    @Test
    fun bluetoothRoutePrefersScoOverA2dp() {
        assertEquals(
            AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
            typeForRoute(
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
            typeForRoute(
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
            typeForRoute(VoiceOutputRoute.Headset, types),
        )
        assertEquals(
            AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
            typeForRoute(VoiceOutputRoute.Bluetooth, types),
        )
    }

    @Test
    fun speakerRouteStaysSpeakerWhenHeadsetTypesExist() {
        assertEquals(
            AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
            typeForRoute(
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

    private fun typeForRoute(route: VoiceOutputRoute, types: Iterable<Int>): Int? {
        val available = types.toSet()
        return communicationDeviceTypesForRoute(route).firstOrNull { it in available }
    }
}
