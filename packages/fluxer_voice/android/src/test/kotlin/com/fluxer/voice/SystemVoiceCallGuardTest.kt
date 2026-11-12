package com.fluxer.voice

import android.content.Context
import android.media.AudioManager
import android.os.Build
import org.junit.After
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [Build.VERSION_CODES.S])
class SystemVoiceCallGuardTest {
    @After
    fun tearDown() {
        FluxerRouteOwnership.holdsRoute = false
        audioManager().mode = AudioManager.MODE_NORMAL
    }

    @Test
    fun fluxerVoiceOwnershipDefersToFluxer() {
        val context = RuntimeEnvironment.getApplication()
        assertFalse(isExternalVoiceCallActive(context, fluxerOwnsVoice = true))
    }

    @Test
    fun idleDeviceWithoutFluxerVoiceIsNotExternalByDefault() {
        val context = RuntimeEnvironment.getApplication()
        assertFalse(isExternalVoiceCallActive(context, fluxerOwnsVoice = false))
    }

    @Test
    fun communicationModeWithoutFluxerRouteIsExternal() {
        val context = RuntimeEnvironment.getApplication()
        audioManager().mode = AudioManager.MODE_IN_COMMUNICATION
        assertTrue(isExternalVoiceCallActive(context, fluxerOwnsVoice = false))
    }

    @Test
    fun communicationModeFromFluxerRouteIsNotExternal() {
        val context = RuntimeEnvironment.getApplication()
        audioManager().mode = AudioManager.MODE_IN_COMMUNICATION
        FluxerRouteOwnership.holdsRoute = true
        assertFalse(isExternalVoiceCallActive(context, fluxerOwnsVoice = false))
    }

    private fun audioManager(): AudioManager {
        return RuntimeEnvironment.getApplication()
            .getSystemService(Context.AUDIO_SERVICE) as AudioManager
    }
}
