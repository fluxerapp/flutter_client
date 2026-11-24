package com.fluxer

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.fluxer.notifications.NotificationCancelPlugin

class FluxerNotificationMarkReadReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != ACTION_MARK_READ) {
            return
        }
        runNotificationAction(context, "notification_mark_read") { appContext ->
            dispatchMarkRead(appContext, intent)
        }
    }

    private fun dispatchMarkRead(context: Context, intent: Intent) {
        val input = markReadInput(intent) ?: return
        NotificationMarkReadDispatcher(
            accounts = SecureAuthTokenReader(context),
            poster = HttpNotificationReplyPoster(),
            ui = AndroidNotificationMarkReadUi(
                context = context,
                failureTitle = intent.getStringExtra(EXTRA_FAILURE_TITLE),
                failureBody = intent.getStringExtra(EXTRA_FAILURE_BODY),
            ),
        ).dispatch(input)
    }

    private fun markReadInput(intent: Intent): NotificationMarkReadInput? {
        val notificationId = intent.getIntExtra(EXTRA_NOTIFICATION_ID, 0)
        if (notificationId <= 0) {
            return null
        }
        return NotificationMarkReadInput(
            channelId = intent.getStringExtra(EXTRA_CHANNEL_ID) ?: "",
            messageId = intent.getStringExtra(EXTRA_MESSAGE_ID) ?: "",
            userId = intent.getStringExtra(EXTRA_USER_ID) ?: "",
            notificationId = notificationId,
            tag = intent.getStringExtra(EXTRA_NOTIFICATION_TAG)?.takeIf { it.isNotEmpty() },
            features = intent.getStringExtra(EXTRA_FEATURES),
        )
    }
}

internal class AndroidNotificationMarkReadUi(
    private val context: Context,
    private val failureTitle: String?,
    private val failureBody: String?,
) : NotificationMarkReadUi {
    override fun clearRead(input: NotificationMarkReadInput) {
        NotificationReplyBridge.cancelIfLatest(
            context,
            input.notificationId,
            input.tag,
            input.messageId,
        )
        NotificationCancelPlugin.cancelForChannel(context, input.channelId, input.messageId)
    }

    override fun showFailure() {
        showNotificationActionFailure(
            context = context,
            id = FAILED_MARK_READ_NOTIFICATION_ID,
            tag = FAILED_MARK_READ_NOTIFICATION_TAG,
            title = failureTitle ?: DEFAULT_FAILURE_TITLE,
            body = failureBody ?: DEFAULT_FAILURE_BODY,
        )
    }

    private companion object {
        const val DEFAULT_FAILURE_TITLE = "Messages"
        const val DEFAULT_FAILURE_BODY = "Couldn't mark as read"
    }
}
