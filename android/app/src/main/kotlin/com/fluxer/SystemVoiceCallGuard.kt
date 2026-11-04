package com.fluxer

import android.content.Context
import android.media.AudioManager
import android.telephony.TelephonyManager
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

internal fun isExternalVoiceCallActive(
    context: Context,
    fluxerOwnsVoice: Boolean,
): Boolean {
    if (fluxerOwnsVoice) {
        return false
    }
    try {
        val telephony = context.getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
        if (telephony.callState != TelephonyManager.CALL_STATE_IDLE) {
            return true
        }
    } catch (_: SecurityException) {
    }
    val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    return when (audioManager.mode) {
        AudioManager.MODE_IN_CALL,
        AudioManager.MODE_IN_COMMUNICATION,
        -> true
        else -> false
    }
}

class SystemVoiceCallGuardBridge(
    private val context: Context,
) {
    fun register(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "isExternalCallActive" -> {
                    val fluxerOwnsVoice =
                        call.argument<Boolean>("fluxerOwnsVoice") ?: false
                    result.success(
                        isExternalVoiceCallActive(context, fluxerOwnsVoice),
                    )
                }
                else -> result.notImplemented()
            }
        }
    }

    private companion object {
        const val CHANNEL_NAME = "fluxer_app/system_voice_call"
    }
}
