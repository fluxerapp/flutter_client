package com.fluxer

import android.content.Intent

object NotificationLaunchIntent {
    const val SELECT_NOTIFICATION_ACTION = "SELECT_NOTIFICATION"

    fun isFreshTap(action: String?, flags: Int): Boolean {
        if (action != SELECT_NOTIFICATION_ACTION) {
            return false
        }
        return flags and Intent.FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY == 0
    }
}
