package com.fluxer

import org.junit.Assert.assertEquals
import org.junit.Test

class VoiceTaskRemovedBridgeTest {
    @Test
    fun channelNameMatchesDartSide() {
        assertEquals("fluxer_app/voice_task_removed", VOICE_TASK_REMOVED_CHANNEL_NAME)
    }

    @Test
    fun notifyMethodMatchesDartSide() {
        assertEquals("notifyTaskRemoved", VOICE_TASK_REMOVED_NOTIFY_METHOD)
    }
}
