package com.fluxer.voice

import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.os.Build
import android.os.Bundle
import com.hiennv.flutter_callkit_incoming.CallkitConnection
import com.hiennv.flutter_callkit_incoming.Data
import com.hiennv.flutter_callkit_incoming.addCall
import com.hiennv.flutter_callkit_incoming.removeAllCalls
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.After
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import org.robolectric.shadows.AudioDeviceInfoBuilder
import org.robolectric.shadows.ShadowBuild
import org.robolectric.util.ReflectionHelpers

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [Build.VERSION_CODES.S])
class VoiceSpeakerRouteApplyTest {
    private lateinit var audioManager: AudioManager
    private lateinit var speaker: AudioDeviceInfo
    private lateinit var earpiece: AudioDeviceInfo

    @Before
    fun setUp() {
        ShadowBuild.setManufacturer("samsung")
        audioManager = RuntimeEnvironment.getApplication()
            .getSystemService(Context.AUDIO_SERVICE) as AudioManager
        speaker = communicationDevice(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER, id = 1)
        earpiece = communicationDevice(AudioDeviceInfo.TYPE_BUILTIN_EARPIECE, id = 2)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            shadowOf(audioManager).setAvailableCommunicationDevices(listOf(speaker, earpiece))
        }
    }

    @After
    fun tearDown() {
        CallkitConnection.clearAll()
        removeAllCalls(RuntimeEnvironment.getApplication())
    }

    private fun communicationDevice(type: Int, id: Int): AudioDeviceInfo {
        val device = AudioDeviceInfoBuilder.newBuilder().setType(type).build()
        val port = ReflectionHelpers.getField<Any>(device, "mPort")
        val handle = ReflectionHelpers.getField<Any>(port, "mHandle")
        ReflectionHelpers.setField(handle, "mId", id)
        ReflectionHelpers.setField(port, "mName", "")
        return device
    }

    @Test
    fun speakerRoutePinsSpeakerFromEarpiece() {
        audioManager.setCommunicationDevice(earpiece)

        val applied = applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Speaker)

        assertEquals(1, applied)
        assertEquals(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER, audioManager.communicationDevice?.type)
    }

    @Test
    fun speakerRouteUsesTheCommunicationDeviceOnEveryManufacturer() {
        ShadowBuild.setManufacturer("OnePlus")
        audioManager.setCommunicationDevice(earpiece)

        applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Speaker)

        assertEquals(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER, audioManager.communicationDevice?.type)
    }

    @Test
    fun earpieceRoutePinsEarpieceFromSpeaker() {
        audioManager.setCommunicationDevice(speaker)

        val applied = applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Earpiece)

        assertEquals(2, applied)
        assertEquals(AudioDeviceInfo.TYPE_BUILTIN_EARPIECE, audioManager.communicationDevice?.type)
    }

    @Test
    fun speakerRouteReportsFailureWithoutLegacySpeakerphone() {
        shadowOf(audioManager).setAvailableCommunicationDevices(listOf(earpiece))

        val applied = applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Speaker)

        assertNull(applied)
        assertNull(audioManager.communicationDevice)
        @Suppress("DEPRECATION")
        assertFalse(audioManager.isSpeakerphoneOn)
    }

    @Test
    fun automaticBluetoothSkipsWatchesButHonoursAnExplicitPick() {
        val watch = namedDevice(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, id = 5, name = "Galaxy Watch6")
        val buds = namedDevice(AudioDeviceInfo.TYPE_BLE_HEADSET, id = 6, name = "Buds")
        val devices = listOf(speaker, watch, buds)

        assertEquals(listOf(6), communicationDeviceCandidates(VoiceOutputRoute.Bluetooth, devices).map { it.id })
        assertEquals(
            listOf(5, 6),
            communicationDeviceCandidates(VoiceOutputRoute.Bluetooth, devices, deviceId = 5).map { it.id },
        )
    }

    @Test
    fun forcedApplyStillPinsTheSameDevice() {
        audioManager.setCommunicationDevice(earpiece)

        val applied = applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Earpiece, force = true)

        assertEquals(2, applied)
        assertEquals(2, audioManager.communicationDevice?.id)
    }

    @Test
    fun bluetoothRoutePinsTheBluetoothDevice() {
        val buds = communicationDevice(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, id = 3)
        shadowOf(audioManager).setAvailableCommunicationDevices(listOf(speaker, earpiece, buds))

        applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Bluetooth)

        assertEquals(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, audioManager.communicationDevice?.type)
    }

    private fun namedDevice(type: Int, id: Int, name: String): AudioDeviceInfo {
        val device = communicationDevice(type, id)
        val port = ReflectionHelpers.getField<Any>(device, "mPort")
        ReflectionHelpers.setField(port, "mName", name)
        return device
    }

    @Test
    fun outputDevicesListEveryCallDeviceInTypeOrder() {
        val car = namedDevice(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, id = 3, name = "Car Audio")
        val buds = namedDevice(AudioDeviceInfo.TYPE_BLE_HEADSET, id = 4, name = "Test Earbuds")
        val devices = voiceOutputDevices(
            listOf(buds, speaker, car, earpiece),
            hasEarpiece = true,
            activeDeviceId = 3,
        )

        assertEquals(
            listOf(
                VoiceOutputDeviceKind.Earpiece,
                VoiceOutputDeviceKind.Speaker,
                VoiceOutputDeviceKind.Bluetooth,
                VoiceOutputDeviceKind.BluetoothLe,
            ),
            devices.map { it.kind },
        )
        assertEquals(listOf(3), devices.filter { it.active }.map { it.id })
        assertEquals("Test Earbuds", devices.last().name)
    }

    @Test
    fun outputDevicesHideTheEarpieceWhileWiredIsConnected() {
        val wired = communicationDevice(AudioDeviceInfo.TYPE_WIRED_HEADSET, id = 5)
        val devices = voiceOutputDevices(
            listOf(speaker, earpiece, wired),
            hasEarpiece = true,
            activeDeviceId = null,
        )

        assertEquals(
            listOf(VoiceOutputDeviceKind.Speaker, VoiceOutputDeviceKind.Wired),
            devices.map { it.kind },
        )
    }

    @Test
    fun bluetoothRouteUsesTheRequestedDevice() {
        ShadowBuild.setManufacturer("Google")
        val car = communicationDevice(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, id = 3)
        val buds = communicationDevice(AudioDeviceInfo.TYPE_BLE_HEADSET, id = 4)
        shadowOf(audioManager).setAvailableCommunicationDevices(listOf(speaker, car, buds))

        applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Bluetooth, deviceId = 4)
        assertEquals(4, audioManager.communicationDevice?.id)

        applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Bluetooth, deviceId = 1)
        assertEquals(3, audioManager.communicationDevice?.id)
    }

    @Test
    @Config(sdk = [Build.VERSION_CODES.R])
    fun olderAndroidBluetoothRouteTurnsSpeakerphoneOff() {
        @Suppress("DEPRECATION")
        audioManager.isSpeakerphoneOn = true

        applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Bluetooth)
        releaseVoiceOutputRoute(audioManager)

        @Suppress("DEPRECATION")
        assertFalse(audioManager.isSpeakerphoneOn)
    }

    @Test
    fun telecomConnectionsOnlyIncludeCallsWithALiveConnection() {
        val context = RuntimeEnvironment.getApplication()
        addCall(context, Data(mapOf("id" to "stored-only")))
        assertTrue(telecomCallConnections(context).isEmpty())

        addCall(context, Data(mapOf("id" to "live")))
        val connection = CallkitConnection(context, "live", Bundle())

        assertEquals(listOf(connection), telecomCallConnections(context))
    }

    @Test
    fun routeDiagnosticsReportCommunicationDeviceAndTelecomCalls() {
        val context = RuntimeEnvironment.getApplication()
        audioManager.setCommunicationDevice(earpiece)
        val connection = CallkitConnection(context, "live", Bundle())

        val diagnostics = voiceRouteDiagnostics(audioManager, listOf(connection), true)

        assertTrue(diagnostics, diagnostics.contains("commDevice=earpiece"))
        assertTrue(diagnostics, diagnostics.contains("telecomOwnsRoute=true"))
        assertTrue(diagnostics, diagnostics.contains("telecomCalls=[NEW/unknown]"))
        assertTrue(diagnostics, Regex("callVolume=\\d+/\\d+ ").containsMatchIn(diagnostics))
        assertTrue(diagnostics, diagnostics.contains("sdk=${Build.VERSION.SDK_INT} "))
        assertTrue(diagnostics, diagnostics.contains("device="))
    }
}
