package com.fluxer.voice

import android.content.Context
import android.media.AudioAttributes
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioTrack
import android.os.PowerManager
import java.nio.ByteBuffer

private const val KEEPALIVE_SAMPLE_RATE = 48_000
private const val KEEPALIVE_FRAMES = 960

internal interface VoiceKeepalive {
    val isPlaying: Boolean

    fun start()

    fun stop()
}

internal class SilentVoiceKeepalive(private val context: Context) : VoiceKeepalive {
    private var track: AudioTrack? = null

    override val isPlaying: Boolean
        get() = track?.playState == AudioTrack.PLAYSTATE_PLAYING

    override fun start() {
        if (track != null) {
            return
        }
        track = buildTrack()?.also {
            try {
                it.play()
            } catch (_: IllegalStateException) {
                it.release()
                track = null
            }
        }
    }

    override fun stop() {
        val current = track ?: return
        track = null
        try {
            current.stop()
        } catch (_: IllegalStateException) {
        }
        current.release()
    }

    private fun buildTrack(): AudioTrack? {
        return try {
            val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
            val sampleRate = audioManager.getProperty(AudioManager.PROPERTY_OUTPUT_SAMPLE_RATE)
                ?.toIntOrNull() ?: KEEPALIVE_SAMPLE_RATE
            val frames = audioManager.getProperty(AudioManager.PROPERTY_OUTPUT_FRAMES_PER_BUFFER)
                ?.toIntOrNull()?.takeIf { it > 0 } ?: KEEPALIVE_FRAMES
            val silence = ByteBuffer.allocateDirect(frames * 2)
            AudioTrack.Builder()
                .setAudioFormat(
                    AudioFormat.Builder()
                        .setEncoding(AudioFormat.ENCODING_PCM_16BIT)
                        .setSampleRate(sampleRate)
                        .setChannelMask(AudioFormat.CHANNEL_OUT_MONO)
                        .build(),
                )
                .setAudioAttributes(
                    AudioAttributes.Builder()
                        .setUsage(AudioAttributes.USAGE_VOICE_COMMUNICATION)
                        .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH)
                        .build(),
                )
                .setBufferSizeInBytes(silence.capacity())
                .setTransferMode(AudioTrack.MODE_STATIC)
                .setSessionId(AudioManager.AUDIO_SESSION_ID_GENERATE)
                .build()
                .apply {
                    write(silence, silence.remaining(), AudioTrack.WRITE_BLOCKING)
                    setLoopPoints(0, frames - 1, -1)
                }
        } catch (_: Exception) {
            null
        }
    }
}

internal class ProximityScreenLock(context: Context) {
    private val wakeLock: PowerManager.WakeLock? = run {
        val power = context.getSystemService(Context.POWER_SERVICE) as? PowerManager ?: return@run null
        if (!power.isWakeLockLevelSupported(PowerManager.PROXIMITY_SCREEN_OFF_WAKE_LOCK)) {
            return@run null
        }
        power.newWakeLock(PowerManager.PROXIMITY_SCREEN_OFF_WAKE_LOCK, "fluxer:voice-proximity")
            .apply { setReferenceCounted(false) }
    }

    val isHeld: Boolean
        get() = wakeLock?.isHeld == true

    fun update(wanted: Boolean) {
        val lock = wakeLock ?: return
        if (wanted && !lock.isHeld) {
            lock.acquire()
        } else if (!wanted && lock.isHeld) {
            lock.release(PowerManager.RELEASE_FLAG_WAIT_FOR_NO_PROXIMITY)
        }
    }
}
