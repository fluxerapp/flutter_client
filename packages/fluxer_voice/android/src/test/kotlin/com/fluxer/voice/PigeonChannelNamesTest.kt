package com.fluxer.voice

import com.fluxer.voice.pip.VOICE_PIP_EVENTS_CHANNEL
import io.flutter.plugin.common.BinaryMessenger
import java.nio.ByteBuffer
import org.junit.Assert.assertEquals
import org.junit.Test

class PigeonChannelNamesTest {
    private class RecordingMessenger : BinaryMessenger {
        val channels = mutableListOf<String>()

        override fun send(channel: String, message: ByteBuffer?) = Unit

        override fun send(channel: String, message: ByteBuffer?, callback: BinaryMessenger.BinaryReply?) = Unit

        override fun setMessageHandler(channel: String, handler: BinaryMessenger.BinaryMessageHandler?) {
            channels.add(channel)
        }
    }

    @Test
    fun sessionStatesChannelMatchesGeneratedName() {
        val messenger = RecordingMessenger()
        VoiceSessionStatesStreamHandler.register(
            messenger,
            object : VoiceSessionStatesStreamHandler() {},
        )
        assertEquals(listOf(VOICE_SESSION_STATES_CHANNEL), messenger.channels)
    }

    @Test
    fun pipEventsChannelMatchesGeneratedName() {
        val messenger = RecordingMessenger()
        VoicePipEventsStreamHandler.register(
            messenger,
            object : VoicePipEventsStreamHandler() {},
        )
        assertEquals(listOf(VOICE_PIP_EVENTS_CHANNEL), messenger.channels)
    }
}
