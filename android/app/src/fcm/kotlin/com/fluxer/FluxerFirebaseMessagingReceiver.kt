package com.fluxer

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.Parcel
import com.google.firebase.messaging.RemoteMessage
import io.flutter.plugins.firebase.messaging.ContextHolder
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingBackgroundService
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingStore
import io.flutter.plugins.firebase.messaging.FlutterFirebaseRemoteMessageLiveData
import java.util.concurrent.Executors

class FluxerFirebaseMessagingReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val extras = intent.extras ?: return
        ensureApplicationContext(context)
        val data = Bundle(extras)
        data.remove("gcm.notification.title")
        data.remove("gcm.notification.body")
        data.remove("gcm.n.title")
        data.remove("gcm.n.body")
        val remoteMessage = RemoteMessage(data)
        val pendingResult = goAsync()
        backgroundExecutor.execute {
            try {
                if (remoteMessage.notification != null) {
                    try {
                        FlutterFirebaseMessagingStore.getInstance()
                            .storeFirebaseMessage(remoteMessage)
                    } catch (_: Exception) {
                    }
                }
                if (FcmMessagingBridge.isApplicationForeground(context)) {
                    FlutterFirebaseRemoteMessageLiveData.getInstance()
                        .postRemoteMessage(remoteMessage)
                    return@execute
                }
                val appContext = context.applicationContext ?: context
                val backgroundIntent =
                    Intent(appContext, FlutterFirebaseMessagingBackgroundService::class.java)
                val parcel = Parcel.obtain()
                try {
                    remoteMessage.writeToParcel(parcel, 0)
                    backgroundIntent.putExtra(
                        FcmMessagingBridge.EXTRA_REMOTE_MESSAGE,
                        parcel.marshall(),
                    )
                    FlutterFirebaseMessagingBackgroundService.enqueueMessageProcessing(
                        appContext,
                        backgroundIntent,
                        remoteMessage.originalPriority == RemoteMessage.PRIORITY_HIGH,
                    )
                } finally {
                    parcel.recycle()
                }
            } catch (_: Exception) {
            } finally {
                pendingResult.finish()
            }
        }
    }

    private fun ensureApplicationContext(context: Context) {
        if (ContextHolder.getApplicationContext() == null) {
            val appContext = context.applicationContext ?: context
            ContextHolder.setApplicationContext(appContext)
        }
    }

    private companion object {
        val backgroundExecutor = Executors.newSingleThreadExecutor()
    }
}
