package com.fluxer.voice

import java.nio.ByteBuffer
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class VoiceNoiseFilterTest {
    private class FakeEngine(override val available: Boolean = true) : NoiseFilterEngine {
        val processed = mutableListOf<Int>()
        var backend = -1

        override fun setBackend(backend: Int): Boolean {
            this.backend = backend
            return true
        }

        override fun process(buffer: ByteBuffer, frames: Int) {
            processed.add(frames)
        }

        override fun stats(): LongArray = longArrayOf(2, 48000, 10, 1, 0, 70_500, 150_000)
    }

    @Test
    fun attachFailsWithoutNativeLibrary() {
        assertFalse(VoiceNoiseFilter(FakeEngine(available = false)) { null }.attach())
    }

    @Test
    fun attachFailsBeforeWebRtcStarts() {
        assertFalse(VoiceNoiseFilter(FakeEngine()) { null }.attach())
    }

    @Test
    fun processorSkipsShortBuffers() {
        val engine = FakeEngine()
        val processor = NoiseFilterProcessor(engine)
        processor.process(3, 480, ByteBuffer.allocateDirect(480 * 4))
        processor.process(1, 480, ByteBuffer.allocateDirect(160 * 4))
        assertEquals(listOf(480), engine.processed)
    }

    @Test
    fun mapsBackendAndStatus() {
        val engine = FakeEngine()
        val filter = VoiceNoiseFilter(engine) { null }
        assertTrue(filter.setBackend(NativeNoiseFilterBackend.GATE))
        assertEquals(1, engine.backend)
        val status = filter.status()
        assertFalse(status.attached)
        assertEquals(NativeNoiseFilterBackend.RNNOISE, status.backend)
        assertEquals(48000L, status.sampleRate)
        assertEquals(70.5, status.averageMicros, 0.0)
        assertEquals(150.0, status.maxMicros, 0.0)
    }
}
