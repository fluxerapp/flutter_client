package com.fluxer.voice

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

private const val METHOD_CHANNEL = "fluxer_app/voice_speaker_route"
private const val EVENT_CHANNEL = "fluxer_app/voice_speaker_route_events"
private const val LEGACY_CALL_OWNER = "call"

internal class VoiceAudioSessionBridge(
    private val session: VoiceAudioSession,
) {
    private val mainHandler = Handler(Looper.getMainLooper())
    private var methodChannel: MethodChannel? = null
    private var eventChannel: EventChannel? = null
    private var sink: ((Map<String, Any?>) -> Unit)? = null
    private val acquiredOwners = mutableSetOf<String>()

    fun register(messenger: BinaryMessenger) {
        methodChannel = MethodChannel(messenger, METHOD_CHANNEL).also {
            it.setMethodCallHandler(::onMethodCall)
        }
        eventChannel = EventChannel(messenger, EVENT_CHANNEL).also {
            it.setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
                        detachSink()
                        val next: (Map<String, Any?>) -> Unit = { event -> events.success(event) }
                        sink = next
                        VoiceAudioSession.addSink(session, next)
                    }

                    override fun onCancel(arguments: Any?) {
                        detachSink()
                    }
                },
            )
        }
    }

    fun unregister() {
        detachSink()
        val owners = acquiredOwners.toList()
        acquiredOwners.clear()
        session.handler.post { owners.forEach(session::release) }
        methodChannel?.setMethodCallHandler(null)
        methodChannel = null
        eventChannel?.setStreamHandler(null)
        eventChannel = null
    }

    private fun detachSink() {
        sink?.let { VoiceAudioSession.removeSink(session, it) }
        sink = null
    }

    private fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val method = call.method
        val owner = call.argument<String>("owner") ?: LEGACY_CALL_OWNER
        val route = voiceOutputRouteFromName(call.argument<String>("route"))
        val deviceId = call.argument<Int>("deviceId")
        val hold = call.argument<Boolean>("hold") ?: false
        val explicit = call.argument<Boolean>("explicit") ?: false
        when (method) {
            "acquire" -> acquiredOwners.add(owner)
            "release" -> acquiredOwners.remove(owner)
            "setRoute" -> if (hold) acquiredOwners.add(LEGACY_CALL_OWNER)
            "clearRouteHold" -> acquiredOwners.remove(LEGACY_CALL_OWNER)
        }
        session.handler.post {
            val value: Any? = try {
                when (method) {
                    "acquire" -> {
                        session.acquire(owner)
                        null
                    }
                    "release" -> {
                        session.release(owner)
                        null
                    }
                    "setPreferredRoute" -> {
                        session.setPreferredRoute(route, deviceId, explicit)
                        null
                    }
                    "refreshRoute" -> {
                        session.refreshRoute("dart")
                        null
                    }
                    "setRoute" -> {
                        session.setPreferredRoute(route, deviceId, explicit = true)
                        if (hold) {
                            session.acquire(LEGACY_CALL_OWNER)
                        }
                        null
                    }
                    "clearRouteHold" -> {
                        session.release(LEGACY_CALL_OWNER)
                        null
                    }
                    "routeDiagnostics" -> session.diagnostics()
                    "availableRoutes" -> session.availableRouteNames()
                    "outputDevices" -> session.outputDeviceMaps()
                    "state" -> session.state("state")
                    else -> NotImplemented
                }
            } catch (error: Exception) {
                mainHandler.post { result.error("voice_audio", error.message, null) }
                return@post
            }
            mainHandler.post {
                if (value === NotImplemented) {
                    result.notImplemented()
                } else {
                    result.success(value)
                }
            }
        }
    }

    private object NotImplemented
}
