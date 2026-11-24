package com.fluxer

import android.app.NotificationManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import androidx.core.app.RemoteInput

class FluxerNotificationReplyReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != ACTION_REPLY) {
            return
        }
        runNotificationAction(context, "notification_reply") { appContext ->
            dispatchReply(appContext, intent)
        }
    }

    companion object {
        fun dispatchReply(context: Context, intent: Intent) {
            val input = replyInput(intent) ?: return
            val ui = AndroidNotificationReplyUi(
                context = context,
                failureTitle = intent.getStringExtra(EXTRA_FAILURE_TITLE),
                failureBody = intent.getStringExtra(EXTRA_FAILURE_BODY),
            )
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
                replyMention = intent.getBooleanExtra(EXTRA_REPLY_MENTION, true),
                features = intent.getStringExtra(EXTRA_FEATURES),
            )
        }
    }
}

internal class AndroidNotificationReplyUi(
    private val context: Context,
    private val failureTitle: String?,
    private val failureBody: String?,
) : NotificationReplyUi {
    override fun cancel(id: Int, tag: String?) {
        context.getSystemService(NotificationManager::class.java)?.cancel(tag, id)
    }

    override fun clearSending(id: Int, tag: String?) {
        NotificationReplyBridge.clearSending(context, id, tag)
    }

    override fun showFailure() {
        showNotificationActionFailure(
            context = context,
            id = FAILED_REPLY_NOTIFICATION_ID,
            tag = FAILED_REPLY_NOTIFICATION_TAG,
            title = failureTitle ?: DEFAULT_FAILURE_TITLE,
            body = failureBody ?: DEFAULT_FAILURE_BODY,
        )
    }

    private companion object {
        const val DEFAULT_FAILURE_TITLE = "Messages"
        const val DEFAULT_FAILURE_BODY = "Couldn't send reply"
    }
}
