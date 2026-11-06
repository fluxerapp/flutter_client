package com.fluxer

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
        return device
    }

    @Test
    fun samsungSpeakerRoutePinsSpeakerFromEarpiece() {
        audioManager.setCommunicationDevice(earpiece)

        applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Speaker)

        assertEquals(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER, audioManager.communicationDevice?.type)
        @Suppress("DEPRECATION")
        assertTrue(audioManager.isSpeakerphoneOn)
        assertEquals(AudioManager.MODE_IN_COMMUNICATION, audioManager.mode)
    }

    @Test
    fun samsungEarpieceRoutePinsEarpieceFromSpeaker() {
        audioManager.setCommunicationDevice(speaker)

        applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Earpiece)

        assertEquals(AudioDeviceInfo.TYPE_BUILTIN_EARPIECE, audioManager.communicationDevice?.type)
        @Suppress("DEPRECATION")
        assertFalse(audioManager.isSpeakerphoneOn)
    }

    @Test
    fun samsungSpeakerRouteKeepsSpeakerphoneWhenDeviceIsUnavailable() {
        shadowOf(audioManager).setAvailableCommunicationDevices(listOf(earpiece))

        applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Speaker)

        assertNull(audioManager.communicationDevice)
        @Suppress("DEPRECATION")
        assertTrue(audioManager.isSpeakerphoneOn)
    }

    @Test
    fun bluetoothRoutePinsTheBluetoothDevice() {
        val buds = communicationDevice(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, id = 3)
        shadowOf(audioManager).setAvailableCommunicationDevices(listOf(speaker, earpiece, buds))

        applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Bluetooth)

        assertEquals(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, audioManager.communicationDevice?.type)
        @Suppress("DEPRECATION")
        assertFalse(audioManager.isSpeakerphoneOn)
    }

    @Test
    fun bluetoothDeviceNameIsNullWithoutABluetoothDevice() {
        assertNull(bluetoothDeviceName(audioManager))
    }

    @Test
    fun bluetoothDeviceNameUsesTheProductName() {
        val buds = communicationDevice(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, id = 3)
        val port = ReflectionHelpers.getField<Any>(buds, "mPort")
        ReflectionHelpers.setField(port, "mName", "Galaxy Buds2 Pro")
        shadowOf(audioManager).setAvailableCommunicationDevices(listOf(speaker, buds))

        assertEquals("Galaxy Buds2 Pro", bluetoothDeviceName(audioManager))
    }

    @Test
    @Config(sdk = [Build.VERSION_CODES.R])
    fun olderAndroidBluetoothRouteTurnsSpeakerphoneOff() {
        @Suppress("DEPRECATION")
        audioManager.isSpeakerphoneOn = true

        applyVoiceOutputRoute(audioManager, VoiceOutputRoute.Bluetooth)
        releaseCallSpeaker(audioManager)

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
    }
}
