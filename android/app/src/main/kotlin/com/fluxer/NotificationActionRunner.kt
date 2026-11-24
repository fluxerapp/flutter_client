package com.fluxer

import android.app.NotificationManager
import android.content.BroadcastReceiver
import android.content.Context
import android.os.PowerManager
import androidx.core.app.NotificationCompat
import kotlin.concurrent.thread

private const val WAKE_LOCK_MS = 30_000L

internal fun BroadcastReceiver.runNotificationAction(
    context: Context,
    name: String,
    action: (Context) -> Unit,
) {
    val pending = goAsync()
    val appContext = context.applicationContext
    val wakeLock = partialWakeLock(appContext, name)
    thread(name = "fluxer-$name") {
        try {
            action(appContext)
        } catch (error: Exception) {
            FluxerNativeMeasure.reportHandled(error, source = name, context = "dispatch")
        } finally {
            releaseWakeLock(wakeLock)
            pending.finish()
        }
    }
}

internal fun showNotificationActionFailure(
    context: Context,
    id: Int,
    tag: String,
    title: String,
    body: String,
) {
    val manager = context.getSystemService(NotificationManager::class.java) ?: return
    val notification = NotificationCompat.Builder(context, MESSAGE_NOTIFICATION_CHANNEL_ID)
        .setSmallIcon(R.drawable.ic_stat_fluxer)
        .setColor(PUSH_ACCENT_COLOR)
        .setContentTitle(title)
        .setContentText(body)
        .setSilent(true)
        .setOnlyAlertOnce(true)
        .setPriority(NotificationCompat.PRIORITY_LOW)
        .build()
    manager.notify(tag, id, notification)
}

private fun partialWakeLock(context: Context, name: String): PowerManager.WakeLock? {
    val power = context.getSystemService(Context.POWER_SERVICE) as? PowerManager ?: return null
    return try {
        power.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "fluxer:$name").apply {
            setReferenceCounted(false)
            acquire(WAKE_LOCK_MS)
        }
    } catch (_: Exception) {
        null
    }
}

private fun releaseWakeLock(wakeLock: PowerManager.WakeLock?) {
    if (wakeLock == null || !wakeLock.isHeld) {
        return
    }
    try {
        wakeLock.release()
    } catch (_: Exception) {
    }
}
