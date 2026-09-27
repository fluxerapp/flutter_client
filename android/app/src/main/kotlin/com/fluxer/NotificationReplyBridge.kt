package com.fluxer

import android.app.Notification
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.RemoteInput
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class NotificationReplyBridge(
    private val context: Context,
) {
    fun register(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                METHOD_ATTACH -> {
                    val id = call.argument<Int>(ARG_ID)
                    val channelId = call.argument<String>(ARG_CHANNEL_ID)
                    val messageId = call.argument<String>(ARG_MESSAGE_ID)
                    val userId = call.argument<String>(ARG_USER_ID)
                    val title = call.argument<String>(ARG_TITLE)
                    val hint = call.argument<String>(ARG_HINT)
                    if (
                        id == null ||
                        channelId.isNullOrEmpty() ||
                        messageId.isNullOrEmpty() ||
                        userId.isNullOrEmpty() ||
                        title.isNullOrEmpty() ||
                        hint.isNullOrEmpty()
                    ) {
                        result.success(false)
                        return@setMethodCallHandler
                    }
                    result.success(
                        attachReplyAction(
                            context = context,
                            id = id,
                            tag = call.argument<String>(ARG_TAG),
                            channelId = channelId,
                            messageId = messageId,
                            userId = userId,
                            title = title,
                            hint = hint,
                        ),
                    )
                }
                else -> result.notImplemented()
            }
        }
    }

    companion object {
        const val CHANNEL_NAME = "fluxer_app/notification_reply"
        const val METHOD_ATTACH = "attachReplyAction"
        const val ARG_ID = "id"
        const val ARG_TAG = "tag"
        const val ARG_CHANNEL_ID = "channelId"
        const val ARG_MESSAGE_ID = "messageId"
        const val ARG_USER_ID = "userId"
        const val ARG_TITLE = "title"
        const val ARG_HINT = "hint"

        fun attachReplyAction(
            context: Context,
            id: Int,
            tag: String?,
            channelId: String,
            messageId: String,
            userId: String,
            title: String,
            hint: String,
        ): Boolean {
            val manager = context.getSystemService(NotificationManager::class.java) ?: return false
            val status = postedNotification(manager, id, tag) ?: return false
            if (hasReplyAction(status.notification)) {
                return true
            }
            val builder = Notification.Builder.recoverBuilder(context, status.notification)
            builder.setOnlyAlertOnce(true)
            builder.addAction(
                replyAction(
                    context = context,
                    id = id,
                    tag = tag,
                    channelId = channelId,
                    messageId = messageId,
                    userId = userId,
                    title = title,
                    hint = hint,
                ),
            )
            publish(manager, id, tag, builder.build())
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

        private fun replyAction(
            context: Context,
            id: Int,
            tag: String?,
            channelId: String,
            messageId: String,
            userId: String,
            title: String,
            hint: String,
        ): Notification.Action {
            val intent = Intent(context, FluxerNotificationReplyReceiver::class.java).apply {
                action = ACTION_REPLY
                data = Uri.parse("fluxer://notification-reply/$id")
                putExtra(EXTRA_NOTIFICATION_ID, id)
                putExtra(EXTRA_NOTIFICATION_TAG, tag)
                putExtra(EXTRA_CHANNEL_ID, channelId)
                putExtra(EXTRA_MESSAGE_ID, messageId)
                putExtra(EXTRA_USER_ID, userId)
            }
            var flags = PendingIntent.FLAG_UPDATE_CURRENT
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                flags = flags or PendingIntent.FLAG_MUTABLE
            }
            val pending = PendingIntent.getBroadcast(context, id, intent, flags)
            val remoteInput = RemoteInput.Builder(EXTRA_REPLY_TEXT)
                .setLabel(hint)
                .build()
            val action = Notification.Action.Builder(null, title, pending)
                .addRemoteInput(remoteInput)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                action.setSemanticAction(Notification.Action.SEMANTIC_ACTION_REPLY)
            }
            return action.build()
        }
    }
}
