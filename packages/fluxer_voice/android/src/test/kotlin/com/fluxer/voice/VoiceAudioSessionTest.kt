package com.fluxer.voice

import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioManager
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import com.hiennv.flutter_callkit_incoming.CallkitConnection
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import org.robolectric.shadows.AudioDeviceInfoBuilder
import org.robolectric.shadows.ShadowLooper
import org.robolectric.util.ReflectionHelpers
import java.util.concurrent.TimeUnit

private class FakeKeepalive : VoiceKeepalive {
    override var isPlaying: Boolean = false

    override fun start() {
        isPlaying = true
    }

    override fun stop() {
        isPlaying = false
    }
}

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [Build.VERSION_CODES.S])
class VoiceAudioSessionTest {
    private lateinit var context: Context
    private lateinit var audioManager: AudioManager
    private lateinit var speaker: AudioDeviceInfo
    private lateinit var earpiece: AudioDeviceInfo
    private lateinit var session: VoiceAudioSession
    private val keepalive = FakeKeepalive()
    private var now = 0L
    private var calls: List<CallkitConnection> = emptyList()
    private val events = mutableListOf<NativeVoiceSessionState>()

    @Before
    fun setUp() {
        context = RuntimeEnvironment.getApplication()
        audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
        speaker = device(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER, id = 1)
        earpiece = device(AudioDeviceInfo.TYPE_BUILTIN_EARPIECE, id = 2)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            shadowOf(audioManager).setAvailableCommunicationDevices(listOf(speaker, earpiece))
        }
        session = VoiceAudioSession(
            context,
            Handler(Looper.getMainLooper()),
            emit = { events.add(it) },
            clock = { now },
            connections = { calls },
            registerPlatformListeners = false,
            keepalive = keepalive,
        )
    }

    @After
    fun tearDown() {
        FluxerRouteOwnership.holdsRoute = false
        audioManager.mode = AudioManager.MODE_NORMAL
        CallkitConnection.clearAll()
    }

    private fun device(type: Int, id: Int, name: String = ""): AudioDeviceInfo {
        val device = AudioDeviceInfoBuilder.newBuilder().setType(type).build()
        val port = ReflectionHelpers.getField<Any>(device, "mPort")
        val handle = ReflectionHelpers.getField<Any>(port, "mHandle")
        ReflectionHelpers.setField(handle, "mId", id)
        ReflectionHelpers.setField(port, "mName", name)
        return device
    }

    private fun idle(ms: Long) {
        var remaining = ms
        while (remaining > 0) {
            val step = minOf(50L, remaining)
            now += step
            ShadowLooper.idleMainLooper(step, TimeUnit.MILLISECONDS)
            remaining -= step
        }
    }

    private fun activate(route: VoiceOutputRoute, explicit: Boolean = true) {
        session.setPreferredRoute(route, null, explicit)
        session.acquire("call")
        idle(2_500)
    }

    private fun drift(to: AudioDeviceInfo) {
        audioManager.setCommunicationDevice(to)
        session.onCommunicationDeviceChanged(to)
        idle(400)
    }

    @Test
    fun systemMoveRightAfterOurOwnChangeIsStillReasserted() {
        activate(VoiceOutputRoute.Earpiece)
        session.refreshRoute("test")

        drift(speaker)

        assertEquals(2, audioManager.communicationDevice?.id)
    }

    @Test
    fun activationClaimsCommunicationModeFocusRouteAndKeepalive() {
        activate(VoiceOutputRoute.Earpiece)

        assertEquals(AudioManager.MODE_IN_COMMUNICATION, audioManager.mode)
        assertEquals(AudioDeviceInfo.TYPE_BUILTIN_EARPIECE, audioManager.communicationDevice?.type)
        assertTrue(FluxerRouteOwnership.holdsRoute)
        assertTrue(keepalive.isPlaying)
        assertEquals(
            android.media.AudioAttributes.USAGE_VOICE_COMMUNICATION,
            shadowOf(audioManager).lastAudioFocusRequest.audioFocusRequest.audioAttributes.usage,
        )
    }

    @Test
    fun communicationModeIsClaimedEvenWhenAlreadySet() {
        audioManager.mode = AudioManager.MODE_IN_COMMUNICATION
        activate(VoiceOutputRoute.Earpiece)

        session.release("call")

        assertEquals(AudioManager.MODE_NORMAL, audioManager.mode)
    }

    @Test
    fun sessionStaysActiveUntilTheLastOwnerReleases() {
        activate(VoiceOutputRoute.Speaker)
        session.acquire("hotswap")

        session.release("call")
        assertTrue(session.isActive)
        assertEquals(AudioManager.MODE_IN_COMMUNICATION, audioManager.mode)

        session.release("hotswap")
        assertFalse(session.isActive)
        assertEquals(AudioManager.MODE_NORMAL, audioManager.mode)
        assertNull(audioManager.communicationDevice)
        assertFalse(FluxerRouteOwnership.holdsRoute)
        assertFalse(keepalive.isPlaying)
    }

    @Test
    fun microphoneMuteIsRestoredOnRelease() {
        audioManager.isMicrophoneMute = true
        activate(VoiceOutputRoute.Speaker)
        assertFalse(audioManager.isMicrophoneMute)

        session.release("call")

        assertTrue(audioManager.isMicrophoneMute)
        audioManager.isMicrophoneMute = false
    }

    @Test
    fun releasingAnUnknownOwnerDoesNothing() {
        activate(VoiceOutputRoute.Speaker)
        session.release("micTest")
        assertTrue(session.isActive)
    }

    @Test
    fun preferredRouteIsStoredWhileInactiveAndAppliedOnActivation() {
        session.setPreferredRoute(VoiceOutputRoute.Earpiece, null, true)
        assertNull(audioManager.communicationDevice)

        session.acquire("call")
        assertEquals(2, audioManager.communicationDevice?.id)

        session.setPreferredRoute(VoiceOutputRoute.Speaker, null, true)
        assertEquals(1, audioManager.communicationDevice?.id)
    }

    @Test
    fun missingBluetoothFallsBackToTheBuiltInDefault() {
        session.setPreferredRoute(VoiceOutputRoute.Earpiece, null, true)
        session.setPreferredRoute(VoiceOutputRoute.Bluetooth, 9, false)
        session.acquire("call")

        assertEquals(2, audioManager.communicationDevice?.id)
    }

    @Test
    fun watchesAreSkippedUnlessPickedExplicitly() {
        val watch = device(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, id = 5, name = "Galaxy Watch6")
        shadowOf(audioManager).setAvailableCommunicationDevices(listOf(speaker, earpiece, watch))

        activate(VoiceOutputRoute.Bluetooth, explicit = false)
        assertEquals(1, audioManager.communicationDevice?.id)

        session.setPreferredRoute(VoiceOutputRoute.Bluetooth, 5, true)
        assertEquals(5, audioManager.communicationDevice?.id)
    }

    @Test
    fun explicitRouteIsReassertedWhenTheSystemMovesIt() {
        activate(VoiceOutputRoute.Earpiece)

        drift(speaker)

        assertEquals(2, audioManager.communicationDevice?.id)
    }

    @Test
    fun automaticRouteFollowsTheSystemInsteadOfFighting() {
        session.hasListeners = true
        activate(VoiceOutputRoute.Earpiece, explicit = false)

        drift(speaker)

        assertEquals(1, audioManager.communicationDevice?.id)
        assertEquals(NativeVoiceRoute.SPEAKER, events.last().route)
    }

    @Test
    fun droppedModeIsReasserted() {
        activate(VoiceOutputRoute.Speaker)
        audioManager.mode = AudioManager.MODE_NORMAL

        session.onModeChanged(AudioManager.MODE_NORMAL)
        idle(400)

        assertEquals(AudioManager.MODE_IN_COMMUNICATION, audioManager.mode)
    }

    @Test
    fun cellularCallModeIsNotFoughtAndRoutingResumesAfter() {
        activate(VoiceOutputRoute.Earpiece)

        session.onModeChanged(AudioManager.MODE_IN_CALL)
        session.setPreferredRoute(VoiceOutputRoute.Speaker, null, true)
        idle(400)
        assertEquals(2, audioManager.communicationDevice?.id)

        session.onModeChanged(AudioManager.MODE_NORMAL)
        assertEquals(1, audioManager.communicationDevice?.id)
    }

    @Test
    fun cappedReassertIsRetriedAfterTheWindow() {
        activate(VoiceOutputRoute.Earpiece)
        repeat(10) { drift(speaker) }
        audioManager.setCommunicationDevice(speaker)

        assertTrue(session.diagnostics(), session.diagnostics().contains("reassert capped"))

        idle(10_000)
        assertEquals(2, audioManager.communicationDevice?.id)
    }

    @Test
    fun focusLossNoLongerBlocksRouting() {
        activate(VoiceOutputRoute.Earpiece)
        session.onFocusChange(AudioManager.AUDIOFOCUS_LOSS)

        session.setPreferredRoute(VoiceOutputRoute.Speaker, null, true)

        assertEquals(1, audioManager.communicationDevice?.id)
    }

    @Test
    fun regainedFocusForcesTheRouteAgain() {
        activate(VoiceOutputRoute.Earpiece)
        session.onFocusChange(AudioManager.AUDIOFOCUS_LOSS_TRANSIENT)
        audioManager.setCommunicationDevice(speaker)

        session.onFocusChange(AudioManager.AUDIOFOCUS_GAIN)

        assertEquals(2, audioManager.communicationDevice?.id)
    }

    @Test
    fun telecomTakesOverWithoutTouchingModeOrDevice() {
        activate(VoiceOutputRoute.Earpiece, explicit = false)
        calls = listOf(CallkitConnection(context, "live", Bundle()))

        session.setPreferredRoute(VoiceOutputRoute.Earpiece, null, false)

        assertNull(audioManager.communicationDevice)
        assertEquals(AudioManager.MODE_IN_COMMUNICATION, audioManager.mode)
        assertTrue(session.diagnostics(), session.diagnostics().contains("telecomOwnsRoute=true"))

        audioManager.setCommunicationDevice(speaker)
        session.onCommunicationDeviceChanged(speaker)
        idle(400)
        assertEquals(1, audioManager.communicationDevice?.id)
    }

    @Test
    fun routeIsReclaimedWhenTheTelecomCallEnds() {
        activate(VoiceOutputRoute.Earpiece)
        calls = listOf(CallkitConnection(context, "live", Bundle()))
        session.setPreferredRoute(VoiceOutputRoute.Earpiece, null, true)
        calls = emptyList()
        audioManager.mode = AudioManager.MODE_NORMAL

        session.onModeChanged(AudioManager.MODE_NORMAL)

        assertEquals(AudioManager.MODE_IN_COMMUNICATION, audioManager.mode)
        assertEquals(2, audioManager.communicationDevice?.id)
    }

    @Test
    fun repeatingTheSamePreferredRouteDoesNotResetTheReassertCap() {
        activate(VoiceOutputRoute.Earpiece)
        repeat(10) {
            drift(speaker)
            session.setPreferredRoute(VoiceOutputRoute.Earpiece, null, true)
            idle(400)
        }

        assertTrue(session.diagnostics(), session.diagnostics().contains("changed=false"))
        assertTrue(session.diagnostics(), session.diagnostics().contains("reassert capped"))
    }

    @Test
    fun silencedMicrophoneIsEmitted() {
        session.hasListeners = true
        activate(VoiceOutputRoute.Speaker)

        session.onMicrophoneSilenced(true)

        assertEquals("micSilenced", events.last().type)
        assertEquals(true, events.last().micSilenced)
    }

    @Test
    fun statesAreOnlyEmittedWhileSomeoneListens() {
        activate(VoiceOutputRoute.Speaker)
        assertTrue(events.isEmpty())

        session.hasListeners = true
        session.setPreferredRoute(VoiceOutputRoute.Earpiece, null, true)

        assertEquals("routeChanged", events.last().type)
        assertEquals(NativeVoiceRoute.EARPIECE, events.last().route)
        assertEquals(listOf(NativeVoiceRoute.SPEAKER, NativeVoiceRoute.EARPIECE), events.last().routes)
    }

    @Test
    @Config(sdk = [Build.VERSION_CODES.R])
    @Suppress("DEPRECATION")
    fun legacyBluetoothFallsBackWhenTheHeadsetNeverConnects() {
        val headset = device(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, id = 7)
        shadowOf(audioManager).setOutputDevices(listOf(speaker, earpiece, headset))

        session.setPreferredRoute(VoiceOutputRoute.Bluetooth, null, true)
        session.acquire("call")
        assertTrue(audioManager.isBluetoothScoOn)

        idle(8_500)

        assertFalse(audioManager.isBluetoothScoOn)
        assertTrue(session.diagnostics(), session.diagnostics().contains("failed:true"))
    }

    @Test
    @Config(sdk = [Build.VERSION_CODES.R])
    @Suppress("DEPRECATION")
    fun legacyBluetoothStaysWhenTheHeadsetConnects() {
        val headset = device(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, id = 7)
        shadowOf(audioManager).setOutputDevices(listOf(speaker, earpiece, headset))

        session.setPreferredRoute(VoiceOutputRoute.Bluetooth, null, true)
        session.acquire("call")
        session.onScoState(AudioManager.SCO_AUDIO_STATE_CONNECTED)
        idle(8_500)

        assertTrue(audioManager.isBluetoothScoOn)
        assertTrue(session.diagnostics(), session.diagnostics().contains("connected:true"))
    }

    @Test
    @Config(sdk = [Build.VERSION_CODES.R])
    @Suppress("DEPRECATION")
    fun legacyBluetoothRestartsAfterTheLinkDrops() {
        val headset = device(AudioDeviceInfo.TYPE_BLUETOOTH_SCO, id = 7)
        shadowOf(audioManager).setOutputDevices(listOf(speaker, earpiece, headset))
        session.setPreferredRoute(VoiceOutputRoute.Bluetooth, null, true)
        session.acquire("call")
        session.onScoState(AudioManager.SCO_AUDIO_STATE_CONNECTED)

        session.onScoState(AudioManager.SCO_AUDIO_STATE_DISCONNECTED)
        idle(400)

        assertTrue(audioManager.isBluetoothScoOn)
        assertTrue(session.diagnostics(), session.diagnostics().contains("requested:true/connected:false"))
    }
}
