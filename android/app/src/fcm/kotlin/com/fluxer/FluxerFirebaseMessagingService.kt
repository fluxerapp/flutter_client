package com.fluxer

import android.content.Intent
import android.os.Bundle
import com.google.android.gms.cloudmessaging.CloudMessage
import com.google.android.gms.cloudmessaging.Rpc
import com.google.firebase.messaging.FirebaseMessagingService

class FluxerFirebaseMessagingService : FirebaseMessagingService() {
    override fun onNewToken(token: String) {
        io.flutter.plugins.firebase.messaging.FlutterFirebaseTokenLiveData
            .getInstance()
            .postToken(token)
    }

    override fun handleIntent(intent: Intent) {
        when (intent.action) {
            REMOTE_INTENT_ACTION,
            DIRECT_BOOT_REMOTE_INTENT_ACTION,
            -> handleRemoteMessageIntent(intent)
            else -> super.handleIntent(intent)
        }
    }

    private fun handleRemoteMessageIntent(intent: Intent) {
        val extras = intent.extras ?: return
        val data = Bundle(extras)
        data.remove("androidx.content.wakelockid")
        FcmMessageForwarder.enrichNotificationIntoData(data)
        Rpc(applicationContext).messageHandled(CloudMessage(intent))
    }

    private companion object {
        const val REMOTE_INTENT_ACTION = "com.google.android.c2dm.intent.RECEIVE"
        const val DIRECT_BOOT_REMOTE_INTENT_ACTION =
            "com.google.firebase.messaging.RECEIVE_DIRECT_BOOT"
    }
}
