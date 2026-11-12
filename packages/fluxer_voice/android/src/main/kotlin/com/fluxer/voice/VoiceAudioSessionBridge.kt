package com.fluxer.voice

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.BinaryMessenger

internal class VoiceAudioSessionBridge(
    private val session: VoiceAudioSession,
) : VoiceAudioSessionHostApi {
    private val mainHandler = Handler(Looper.getMainLooper())
    private var messenger: BinaryMessenger? = null
    private var sink: ((NativeVoiceSessionState) -> Unit)? = null
    private val acquiredOwners = mutableSetOf<String>()
    private val stateStream = object : VoiceSessionStatesStreamHandler() {
        override fun onListen(p0: Any?, sink: PigeonEventSink<NativeVoiceSessionState>) {
            attachSink(sink)
        }

        override fun onCancel(p0: Any?) {
            detachSink()
        }
    }

    fun register(messenger: BinaryMessenger) {
        this.messenger = messenger
        VoiceAudioSessionHostApi.setUp(messenger, this)
        VoiceSessionStatesStreamHandler.register(messenger, stateStream)
    }

    fun unregister() {
        detachSink()
        val owners = acquiredOwners.toList()
        acquiredOwners.clear()
        session.handler.post { owners.forEach(session::release) }
        messenger?.let { VoiceAudioSessionHostApi.setUp(it, null) }
        messenger = null
    }

    override fun acquire(owner: String, callback: (Result<Unit>) -> Unit) {
        acquiredOwners.add(owner)
        onSession(callback) { session.acquire(owner) }
    }

    override fun release(owner: String, callback: (Result<Unit>) -> Unit) {
        acquiredOwners.remove(owner)
        onSession(callback) { session.release(owner) }
    }

    override fun setPreferredRoute(
        route: NativeVoiceRoute,
        explicit: Boolean,
        deviceId: Long?,
        callback: (Result<Unit>) -> Unit,
    ) {
        onSession(callback) {
            session.setPreferredRoute(route.toVoiceOutputRoute(), deviceId?.toInt(), explicit)
        }
    }

    override fun refreshRoute(callback: (Result<Unit>) -> Unit) {
        onSession(callback) { session.refreshRoute("dart") }
    }

    override fun state(callback: (Result<NativeVoiceSessionState>) -> Unit) {
        onSession(callback) { session.state("state") }
    }

    override fun diagnostics(callback: (Result<String>) -> Unit) {
        onSession(callback) { session.diagnostics() }
    }

    override fun availableRoutes(callback: (Result<List<NativeVoiceRoute>>) -> Unit) {
        onSession(callback) { session.availableRoutes() }
    }

    override fun outputDevices(callback: (Result<List<NativeVoiceDevice>>) -> Unit) {
        onSession(callback) { session.outputDeviceMessages() }
    }

    private fun attachSink(events: PigeonEventSink<NativeVoiceSessionState>) {
        detachSink()
        val next: (NativeVoiceSessionState) -> Unit = { state -> events.success(state) }
        sink = next
        VoiceAudioSession.addSink(session, next)
    }

    private fun detachSink() {
        sink?.let { VoiceAudioSession.removeSink(session, it) }
        sink = null
    }

    private fun <T> onSession(callback: (Result<T>) -> Unit, block: () -> T) {
        session.handler.post {
            val result = try {
                Result.success(block())
            } catch (error: Exception) {
                Result.failure(FluxerVoiceError("voice_audio", error.message))
            }
            mainHandler.post { callback(result) }
        }
    }
}
