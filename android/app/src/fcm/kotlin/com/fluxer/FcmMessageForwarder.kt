package com.fluxer

import android.os.Bundle

object FcmMessageForwarder {
    // Keep in sync with lib/core/push/fcm/fcm_gcm_notification_enrichment.dart
    fun enrichNotificationIntoData(bundle: Bundle) {
        if (!bundle.containsKey("title")) {
            val title = bundle.getString("gcm.notification.title")
            if (!title.isNullOrBlank()) {
                bundle.putString("title", title)
            }
        }
        if (!bundle.containsKey("body")) {
            val body = bundle.getString("gcm.notification.body")
            if (!body.isNullOrBlank()) {
                bundle.putString("body", body)
            }
        }
    }
}
