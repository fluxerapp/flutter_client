package com.fluxer.voice

import com.cloudwebrtc.webrtc.audio.AudioProcessingAdapter
import com.cloudwebrtc.webrtc.audio.AudioProcessingController
import io.flutter.plugin.common.BinaryMessenger
import java.lang.ref.WeakReference
import java.nio.ByteBuffer

internal interface NoiseFilterEngine {
    val available: Boolean

    fun setBackend(backend: Int): Boolean

    fun process(buffer: ByteBuffer, frames: Int)

    fun stats(): LongArray
}

internal object NativeNoiseFilterEngine : NoiseFilterEngine {
    override val available: Boolean by lazy {
        try {
            System.loadLibrary("fluxer_voice")
            true
        } catch (_: UnsatisfiedLinkError) {
            false
        }
    }

    override fun setBackend(backend: Int): Boolean = available && nativeSetBackend(backend)

    override fun process(buffer: ByteBuffer, frames: Int) = nativeProcess(buffer, frames)

    override fun stats(): LongArray = if (available) nativeStats() else LongArray(STATS_SIZE)

    private external fun nativeSetBackend(backend: Int): Boolean

    private external fun nativeProcess(buffer: ByteBuffer, frames: Int)

    private external fun nativeStats(): LongArray

    private const val STATS_SIZE = 7
}

internal class NoiseFilterProcessor(
    private val engine: NoiseFilterEngine,
) : AudioProcessingAdapter.ExternalAudioFrameProcessing {
    override fun initialize(sampleRateHz: Int, numChannels: Int) = Unit

    override fun reset(newRate: Int) = Unit

    override fun process(numBands: Int, numFrames: Int, buffer: ByteBuffer) {
        if (buffer.capacity() >= numFrames * Float.SIZE_BYTES) {
            engine.process(buffer, numFrames)
        }
    }
}

internal class VoiceNoiseFilter(
    private val engine: NoiseFilterEngine = NativeNoiseFilterEngine,
    private val controller: () -> AudioProcessingController?,
) : VoiceNoiseFilterHostApi {
    private val processor = NoiseFilterProcessor(engine)
    private var attachedTo = WeakReference<AudioProcessingController>(null)
    private var messenger: BinaryMessenger? = null

    fun register(messenger: BinaryMessenger) {
        this.messenger = messenger
        VoiceNoiseFilterHostApi.setUp(messenger, this)
    }

    fun unregister() {
        messenger?.let { VoiceNoiseFilterHostApi.setUp(it, null) }
        messenger = null
        attachedTo.get()?.capturePostProcessing?.removeProcessor(processor)
        attachedTo.clear()
    }

    override fun attach(): Boolean {
        if (!engine.available) {
            return false
        }
        val current = controller() ?: return false
        if (attachedTo.get() !== current) {
            attachedTo.get()?.capturePostProcessing?.removeProcessor(processor)
            current.capturePostProcessing.addProcessor(processor)
            attachedTo = WeakReference(current)
        }
        return true
    }

    override fun setBackend(backend: NativeNoiseFilterBackend): Boolean =
        engine.setBackend(backend.raw)

    override fun status(): NativeNoiseFilterStatus {
        val stats = engine.stats()
        return NativeNoiseFilterStatus(
            attached = attachedTo.get() != null,
            backend = NativeNoiseFilterBackend.ofRaw(stats[0].toInt())
                ?: NativeNoiseFilterBackend.NONE,
            sampleRate = stats[1],
            frames = stats[2],
            bypassedFrames = stats[3],
            recoveredFrames = stats[4],
            averageMicros = stats[5] / NANOS_PER_MICRO,
            maxMicros = stats[6] / NANOS_PER_MICRO,
        )
    }

    private companion object {
        const val NANOS_PER_MICRO = 1000.0
    }
}
