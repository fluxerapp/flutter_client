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

class FluxerFirebaseMessagingReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val extras = intent.extras ?: return
        ensureApplicationContext(context)
        val data = Bundle(extras)
        FcmMessageForwarder.enrichNotificationIntoData(data)
        val remoteMessage = RemoteMessage(data)
        if (remoteMessage.notification != null) {
            FlutterFirebaseMessagingStore.getInstance().storeFirebaseMessage(remoteMessage)
        }
        if (FcmMessagingBridge.isApplicationForeground(context)) {
            FlutterFirebaseRemoteMessageLiveData.getInstance().postRemoteMessage(remoteMessage)
            return
        }
        val backgroundIntent =
            Intent(context, FlutterFirebaseMessagingBackgroundService::class.java)
        val parcel = Parcel.obtain()
        try {
            remoteMessage.writeToParcel(parcel, 0)
            backgroundIntent.putExtra(
                FcmMessagingBridge.EXTRA_REMOTE_MESSAGE,
                parcel.marshall(),
            )
            FlutterFirebaseMessagingBackgroundService.enqueueMessageProcessing(
                context,
                backgroundIntent,
                remoteMessage.originalPriority == RemoteMessage.PRIORITY_HIGH,
            )
        } finally {
            parcel.recycle()
        }
    }

    private fun ensureApplicationContext(context: Context) {
        if (ContextHolder.getApplicationContext() == null) {
            val appContext = context.applicationContext ?: context
            ContextHolder.setApplicationContext(appContext)
        }
    }
}
