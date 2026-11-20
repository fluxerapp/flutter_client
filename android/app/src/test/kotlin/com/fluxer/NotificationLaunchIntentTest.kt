package com.fluxer

import android.content.Intent
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class NotificationLaunchIntentTest {
    @Test
    fun acceptsNotificationTap() {
        assertTrue(
            NotificationLaunchIntent.isFreshTap(
                NotificationLaunchIntent.SELECT_NOTIFICATION_ACTION,
                Intent.FLAG_ACTIVITY_NEW_TASK,
            ),
        )
    }

    @Test
    fun rejectsNotificationTapRelaunchedFromRecents() {
        assertFalse(
            NotificationLaunchIntent.isFreshTap(
                NotificationLaunchIntent.SELECT_NOTIFICATION_ACTION,
                Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY,
            ),
        )
    }

    @Test
    fun rejectsOtherLaunches() {
        assertFalse(NotificationLaunchIntent.isFreshTap(Intent.ACTION_MAIN, 0))
        assertFalse(NotificationLaunchIntent.isFreshTap(Intent.ACTION_VIEW, 0))
        assertFalse(NotificationLaunchIntent.isFreshTap(null, 0))
        assertFalse(NotificationLaunchIntent.isFreshTap("SELECT_FOREGROUND_NOTIFICATION", 0))
    }
}
