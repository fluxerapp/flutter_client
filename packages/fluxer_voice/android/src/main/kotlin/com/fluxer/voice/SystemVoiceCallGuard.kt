package com.fluxer.voice

import android.content.Context
import android.media.AudioManager
import android.telephony.TelephonyManager
import io.flutter.plugin.common.BinaryMessenger

internal fun isExternalVoiceCallActive(
    context: Context,
    fluxerOwnsVoice: Boolean,
): Boolean {
    if (fluxerOwnsVoice || FluxerRouteOwnership.holdsRoute) {
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

internal class SystemVoiceCallGuardBridge(
    private val context: Context,
) : SystemVoiceCallGuardHostApi {
    private var messenger: BinaryMessenger? = null

    fun register(messenger: BinaryMessenger) {
        this.messenger = messenger
        SystemVoiceCallGuardHostApi.setUp(messenger, this)
    }

    fun unregister() {
        messenger?.let { SystemVoiceCallGuardHostApi.setUp(it, null) }
        messenger = null
    }

    override fun isExternalCallActive(fluxerOwnsVoice: Boolean, callback: (Result<Boolean>) -> Unit) {
        callback(Result.success(isExternalVoiceCallActive(context, fluxerOwnsVoice)))
    }
}
