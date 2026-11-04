package com.fluxer

import android.app.KeyguardManager
import android.content.Context

object FcmMessagingBridge {
    const val EXTRA_REMOTE_MESSAGE = "notification"

    fun isApplicationForeground(context: Context): Boolean {
        if (!MainEngineState.visible) {
            return false
        }
        val keyguardManager =
            context.getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager?
        return keyguardManager?.isKeyguardLocked != true
    }
}
