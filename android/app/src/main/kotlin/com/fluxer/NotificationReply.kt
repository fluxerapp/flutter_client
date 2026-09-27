package com.fluxer

import java.net.URLEncoder

internal const val ACTION_REPLY = "com.fluxer.action.NOTIFICATION_REPLY"
internal const val EXTRA_REPLY_TEXT = "fluxer_reply_text"
internal const val EXTRA_NOTIFICATION_ID = "notification_id"
internal const val EXTRA_NOTIFICATION_TAG = "notification_tag"
internal const val EXTRA_CHANNEL_ID = "channel_id"
internal const val EXTRA_MESSAGE_ID = "message_id"
internal const val EXTRA_USER_ID = "target_user_id"

internal const val FAILED_REPLY_NOTIFICATION_ID = 900001
internal const val FAILED_REPLY_NOTIFICATION_TAG = "fluxer_reply_failed"
internal const val MESSAGE_NOTIFICATION_CHANNEL_ID = "fluxer_messages"

internal data class NotificationReplyAccount(
    val token: String,
    val apiBaseUrl: String,
)

internal fun interface NotificationReplyAccountLookup {
    fun read(userId: String): NotificationReplyAccount?
}

internal data class NotificationReplyRequest(
    val url: String,
    val authorization: String,
    val body: String,
)

internal data class NotificationReplyInput(
    val text: String,
    val channelId: String,
    val messageId: String,
    val userId: String,
    val notificationId: Int,
    val tag: String?,
)

internal enum class NotificationReplyOutcome {
    Sent,
    Failed,
    Skipped,
}

internal fun interface NotificationReplyPoster {
    fun post(request: NotificationReplyRequest): Boolean
}

internal interface NotificationReplyUi {
    fun cancel(id: Int, tag: String?)

    fun clearSending(id: Int, tag: String?)

    fun showFailure()
}

internal fun replyAuthorizationHeader(token: String): String {
    val trimmed = token.trim()
    val bearer = "Bearer "
    if (trimmed.startsWith(bearer)) {
        return trimmed.substring(bearer.length).trim()
    }
    return trimmed
}

internal fun buildNotificationReplyRequest(
    account: NotificationReplyAccount,
    channelId: String,
    messageId: String,
    content: String,
): NotificationReplyRequest? {
    val base = account.apiBaseUrl.trim().trimEnd('/')
    val authorization = replyAuthorizationHeader(account.token)
    if (base.isEmpty() || authorization.isEmpty() || channelId.isEmpty() || messageId.isEmpty()) {
        return null
    }
    val encodedChannel = URLEncoder.encode(channelId, Charsets.UTF_8.name()).replace("+", "%20")
    return NotificationReplyRequest(
        url = "$base/channels/$encodedChannel/messages",
        authorization = authorization,
        body = notificationReplyBody(content, messageId),
    )
}

internal fun notificationReplyBody(content: String, messageId: String): String {
    return "{" +
        "\"content\":${jsonString(content)}," +
        "\"message_reference\":{\"message_id\":${jsonString(messageId)}}," +
        "\"allowed_mentions\":{\"replied_user\":true}" +
        "}"
}

internal class NotificationReplyDispatcher(
    private val accounts: NotificationReplyAccountLookup,
    private val poster: NotificationReplyPoster,
    private val ui: NotificationReplyUi,
) {
    fun dispatch(input: NotificationReplyInput): NotificationReplyOutcome {
        val content = input.text.trim()
        if (
            content.isEmpty() ||
            input.channelId.isEmpty() ||
            input.messageId.isEmpty() ||
            input.userId.isEmpty()
        ) {
            ui.clearSending(input.notificationId, input.tag)
            return NotificationReplyOutcome.Skipped
        }
        val account = accounts.read(input.userId)
        val request = account?.let {
            buildNotificationReplyRequest(it, input.channelId, input.messageId, content)
        }
        if (request == null) {
            return fail(input)
        }
        val sent = try {
            poster.post(request)
        } catch (_: Exception) {
            false
        }
        if (!sent) {
            return fail(input)
        }
        ui.cancel(input.notificationId, input.tag)
        return NotificationReplyOutcome.Sent
    }

    private fun fail(input: NotificationReplyInput): NotificationReplyOutcome {
        ui.clearSending(input.notificationId, input.tag)
        ui.showFailure()
        return NotificationReplyOutcome.Failed
    }
}

private fun jsonString(value: String): String {
    val out = StringBuilder(value.length + 2)
    out.append('"')
    for (ch in value) {
        when (ch) {
            '\\' -> out.append("\\\\")
            '"' -> out.append("\\\"")
            '\n' -> out.append("\\n")
            '\r' -> out.append("\\r")
            '\t' -> out.append("\\t")
            else -> {
                if (ch.code < 0x20) {
                    out.append("\\u")
                    out.append(ch.code.toString(16).padStart(4, '0'))
                } else {
                    out.append(ch)
                }
            }
        }
    }
    out.append('"')
    return out.toString()
}
