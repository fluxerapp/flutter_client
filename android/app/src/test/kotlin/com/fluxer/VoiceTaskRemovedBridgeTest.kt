package com.fluxer

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
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

    @Test
    fun removingTheMainTaskEndsVoice() {
        var checked = false
        assertTrue(shouldEndVoiceForRemovedTask(removedRootIsMain = true) { checked = true; true })
        assertFalse(checked)
    }

    @Test
    fun removingASideTaskKeepsVoiceWhileTheMainTaskIsAlive() {
        assertFalse(shouldEndVoiceForRemovedTask(removedRootIsMain = false) { true })
    }

    @Test
    fun removingASideTaskEndsVoiceOnceTheMainTaskIsGone() {
        assertTrue(shouldEndVoiceForRemovedTask(removedRootIsMain = false) { false })
    }
}
