package com.fluxer

import android.media.AudioDeviceInfo
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
        assertEquals(VoiceOutputRoute.Speaker, voiceOutputRouteFromName(null))
    }

    @Test
    fun speakerRouteKeepsSpeakerphoneOn() {
        assertTrue(speakerphoneOnForRoute(VoiceOutputRoute.Speaker))
        assertFalse(speakerphoneOnForRoute(VoiceOutputRoute.Earpiece))
        assertFalse(speakerphoneOnForRoute(VoiceOutputRoute.Headset))
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
    fun listsHeadsetWhenAHeadsetTypeIsPresent() {
        assertEquals(
            listOf("speaker", "earpiece", "headset"),
            availableVoiceOutputRouteNames(
                outputTypes = setOf(
                    AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
                    AudioDeviceInfo.TYPE_BUILTIN_EARPIECE,
                    AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
                ),
                hasEarpiece = false,
            ),
        )
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
    }

    @Test
    fun headsetRoutePrefersScoOverA2dp() {
        assertEquals(
            AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
            communicationDeviceTypeForRoute(
                VoiceOutputRoute.Headset,
                listOf(
                    AudioDeviceInfo.TYPE_BLUETOOTH_A2DP,
                    AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
                ),
            ),
        )
    }

    @Test
    fun headsetRouteDoesNotSelectA2dpOnly() {
        assertNull(
            communicationDeviceTypeForRoute(
                VoiceOutputRoute.Headset,
                listOf(AudioDeviceInfo.TYPE_BLUETOOTH_A2DP),
            ),
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
    fun speakerIsActiveWhenSpeakerphoneIsOnAndDeviceIsClear() {
        assertTrue(
            activeCommunicationDeviceTypeMatchesRoute(
                route = VoiceOutputRoute.Speaker,
                activeDeviceType = null,
                speakerphoneOn = true,
                sdkAtLeast31 = true,
            ),
        )
        assertTrue(
            activeCommunicationDeviceTypeMatchesRoute(
                route = VoiceOutputRoute.Speaker,
                activeDeviceType = AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
                speakerphoneOn = true,
                sdkAtLeast31 = true,
            ),
        )
        assertFalse(
            activeCommunicationDeviceTypeMatchesRoute(
                route = VoiceOutputRoute.Speaker,
                activeDeviceType = AudioDeviceInfo.TYPE_BUILTIN_EARPIECE,
                speakerphoneOn = true,
                sdkAtLeast31 = true,
            ),
        )
        assertFalse(
            activeCommunicationDeviceTypeMatchesRoute(
                route = VoiceOutputRoute.Speaker,
                activeDeviceType = AudioDeviceInfo.TYPE_BUILTIN_SPEAKER,
                speakerphoneOn = false,
                sdkAtLeast31 = true,
            ),
        )
    }

    @Test
    fun activeRouteMatchesEarpieceOverBluetoothTypes() {
        assertTrue(
            activeCommunicationDeviceTypeMatchesRoute(
                route = VoiceOutputRoute.Earpiece,
                activeDeviceType = AudioDeviceInfo.TYPE_BUILTIN_EARPIECE,
                speakerphoneOn = false,
                sdkAtLeast31 = true,
            ),
        )
        assertFalse(
            activeCommunicationDeviceTypeMatchesRoute(
                route = VoiceOutputRoute.Earpiece,
                activeDeviceType = AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
                speakerphoneOn = false,
                sdkAtLeast31 = true,
            ),
        )
    }

    @Test
    fun activeRouteMatchesHeadsetCommunicationDevice() {
        assertTrue(
            activeCommunicationDeviceTypeMatchesRoute(
                route = VoiceOutputRoute.Headset,
                activeDeviceType = AudioDeviceInfo.TYPE_BLUETOOTH_SCO,
                speakerphoneOn = false,
                sdkAtLeast31 = true,
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
}
