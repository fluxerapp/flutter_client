package com.fluxer

import android.app.Notification
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.RemoteInput
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class NotificationReplyBridge(
    private val context: Context,
) {
    fun register(messenger: BinaryMessenger) {
        MethodChannel(messenger, CHANNEL_NAME).setMethodCallHandler { call, result ->
            when (call.method) {
                METHOD_ATTACH -> {
                    val action = replyAction(call)
                    result.success(action != null && attachReplyAction(context, action))
                }
                else -> result.notImplemented()
            }
        }
    }

    companion object {
        const val CHANNEL_NAME = "fluxer_app/notification_reply"
        const val METHOD_ATTACH = "attachReplyAction"

        private fun replyAction(call: MethodCall): NotificationReplyAction? {
            val id = call.argument<Int>("id") ?: return null
            val channelId = call.argument<String>("channelId")
            val messageId = call.argument<String>("messageId")
            val userId = call.argument<String>("userId")
            val title = call.argument<String>("title")
            val hint = call.argument<String>("hint")
            if (
                channelId.isNullOrEmpty() ||
                messageId.isNullOrEmpty() ||
                userId.isNullOrEmpty() ||
                title.isNullOrEmpty() ||
                hint.isNullOrEmpty()
            ) {
                return null
            }
            return NotificationReplyAction(
                id = id,
                tag = call.argument<String>("tag"),
                channelId = channelId,
                messageId = messageId,
                userId = userId,
                title = title,
                hint = hint,
                replyMention = call.argument<Boolean>("replyMention") ?: true,
                features = call.argument<String>("features"),
                failureTitle = call.argument<String>("failureTitle"),
                failureBody = call.argument<String>("failureBody"),
            )
        }

        private fun attachReplyAction(context: Context, action: NotificationReplyAction): Boolean {
            val manager = context.getSystemService(NotificationManager::class.java) ?: return false
            val status = postedNotification(manager, action.id, action.tag) ?: return false
            if (hasReplyAction(status.notification)) {
                return true
            }
            val builder = Notification.Builder.recoverBuilder(context, status.notification)
            builder.setOnlyAlertOnce(true)
            builder.addAction(notificationAction(context, action))
            publish(manager, action.id, action.tag, builder.build())
            return true
        }

        fun clearSending(context: Context, id: Int, tag: String?) {
            val manager = context.getSystemService(NotificationManager::class.java) ?: return
            val status = postedNotification(manager, id, tag) ?: return
            val builder = Notification.Builder.recoverBuilder(context, status.notification)
            builder.setOnlyAlertOnce(true)
            publish(manager, id, tag, builder.build())
        }

        private fun postedNotification(
            manager: NotificationManager,
            id: Int,
            tag: String?,
        ) = manager.activeNotifications.firstOrNull { statusBar ->
            statusBar.id == id && (tag.isNullOrEmpty() || statusBar.tag == tag)
        }

        private fun hasReplyAction(notification: Notification): Boolean {
            val actions = notification.actions ?: return false
            return actions.any { action ->
                action.remoteInputs?.any { it.resultKey == EXTRA_REPLY_TEXT } == true
            }
        }

        private fun publish(
            manager: NotificationManager,
            id: Int,
            tag: String?,
            notification: Notification,
        ) {
            if (tag.isNullOrEmpty()) {
                manager.notify(id, notification)
            } else {
                manager.notify(tag, id, notification)
            }
        }

        private fun notificationAction(
            context: Context,
            action: NotificationReplyAction,
        ): Notification.Action {
            val intent = Intent(context, FluxerNotificationReplyReceiver::class.java).apply {
                this.action = ACTION_REPLY
                data = Uri.parse("fluxer://notification-reply/${action.id}")
                putExtra(EXTRA_NOTIFICATION_ID, action.id)
                putExtra(EXTRA_NOTIFICATION_TAG, action.tag)
                putExtra(EXTRA_CHANNEL_ID, action.channelId)
                putExtra(EXTRA_MESSAGE_ID, action.messageId)
                putExtra(EXTRA_USER_ID, action.userId)
                putExtra(EXTRA_REPLY_MENTION, action.replyMention)
                putExtra(EXTRA_FEATURES, action.features)
                putExtra(EXTRA_FAILURE_TITLE, action.failureTitle)
                putExtra(EXTRA_FAILURE_BODY, action.failureBody)
            }
            var flags = PendingIntent.FLAG_UPDATE_CURRENT
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                flags = flags or PendingIntent.FLAG_MUTABLE
            }
            val pending = PendingIntent.getBroadcast(context, action.id, intent, flags)
            val remoteInput = RemoteInput.Builder(EXTRA_REPLY_TEXT)
                .setLabel(action.hint)
                .build()
            val builder = Notification.Action.Builder(null, action.title, pending)
                .addRemoteInput(remoteInput)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                builder.setSemanticAction(Notification.Action.SEMANTIC_ACTION_REPLY)
            }
            return builder.build()
        }
    }
}

private data class NotificationReplyAction(
    val id: Int,
    val tag: String?,
    val channelId: String,
    val messageId: String,
    val userId: String,
    val title: String,
    val hint: String,
    val replyMention: Boolean,
    val features: String?,
    val failureTitle: String?,
    val failureBody: String?,
)
