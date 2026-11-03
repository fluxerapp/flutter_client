package com.fluxer

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment

@RunWith(RobolectricTestRunner::class)
class SystemVoiceCallGuardTest {
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
}
