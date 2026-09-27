package com.fluxer

import android.app.NotificationManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.PowerManager
import androidx.core.app.NotificationCompat
import androidx.core.app.RemoteInput
import kotlin.concurrent.thread

class FluxerNotificationReplyReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != ACTION_REPLY) {
            return
        }
        val pending = goAsync()
        val appContext = context.applicationContext
        val wakeLock = partialWakeLock(appContext)
        thread(name = "fluxer-notification-reply") {
            try {
                dispatchReply(appContext, intent)
            } finally {
                releaseWakeLock(wakeLock)
                pending.finish()
            }
        }
    }

    companion object {
        fun dispatchReply(context: Context, intent: Intent) {
            val input = replyInput(intent) ?: return
            val ui = AndroidNotificationReplyUi(context)
            NotificationReplyDispatcher(
                accounts = SecureAuthTokenReader(context),
                poster = HttpNotificationReplyPoster(),
                ui = ui,
            ).dispatch(input)
        }

        private fun replyInput(intent: Intent): NotificationReplyInput? {
            val results = RemoteInput.getResultsFromIntent(intent)
            val text = results?.getCharSequence(EXTRA_REPLY_TEXT)?.toString() ?: ""
            val channelId = intent.getStringExtra(EXTRA_CHANNEL_ID) ?: ""
            val messageId = intent.getStringExtra(EXTRA_MESSAGE_ID) ?: ""
            val userId = intent.getStringExtra(EXTRA_USER_ID) ?: ""
            val notificationId = intent.getIntExtra(EXTRA_NOTIFICATION_ID, 0)
            if (notificationId <= 0) {
                return null
            }
            val tag = intent.getStringExtra(EXTRA_NOTIFICATION_TAG)
            return NotificationReplyInput(
                text = text,
                channelId = channelId,
                messageId = messageId,
                userId = userId,
                notificationId = notificationId,
                tag = tag?.takeIf { it.isNotEmpty() },
            )
        }

        private fun partialWakeLock(context: Context): PowerManager.WakeLock? {
            val power = context.getSystemService(Context.POWER_SERVICE) as? PowerManager
                ?: return null
            return try {
                power.newWakeLock(
                    PowerManager.PARTIAL_WAKE_LOCK,
                    "fluxer:notification_reply",
                ).apply {
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

        private const val WAKE_LOCK_MS = 30_000L
    }
}

internal class AndroidNotificationReplyUi(
    private val context: Context,
) : NotificationReplyUi {
    override fun cancel(id: Int, tag: String?) {
        val manager = manager() ?: return
        if (tag.isNullOrEmpty()) {
            manager.cancel(id)
        } else {
            manager.cancel(tag, id)
        }
    }

    override fun clearSending(id: Int, tag: String?) {
        NotificationReplyBridge.clearSending(context, id, tag)
    }

    override fun showFailure() {
        val manager = manager() ?: return
        val notification = NotificationCompat.Builder(context, MESSAGE_NOTIFICATION_CHANNEL_ID)
            .setSmallIcon(R.drawable.fluxer_logo_monochrome)
            .setContentTitle("Messages")
            .setContentText("Couldn't send reply")
            .setSilent(true)
            .setOnlyAlertOnce(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .build()
        manager.notify(FAILED_REPLY_NOTIFICATION_TAG, FAILED_REPLY_NOTIFICATION_ID, notification)
    }

    private fun manager(): NotificationManager? {
        return context.getSystemService(NotificationManager::class.java)
    }
}
