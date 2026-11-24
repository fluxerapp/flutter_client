package com.fluxer

internal const val ACTION_MARK_READ = "com.fluxer.action.NOTIFICATION_MARK_READ"

internal const val FAILED_MARK_READ_NOTIFICATION_ID = 900002
internal const val FAILED_MARK_READ_NOTIFICATION_TAG = "fluxer_mark_read_failed"

internal data class NotificationMarkReadInput(
    val channelId: String,
    val messageId: String,
    val userId: String,
    val notificationId: Int,
    val tag: String?,
    val features: String? = null,
)

internal enum class NotificationMarkReadOutcome {
    Sent,
    Failed,
    Skipped,
}

internal interface NotificationMarkReadUi {
    fun clearRead(input: NotificationMarkReadInput)

    fun showFailure()
}

internal fun buildNotificationMarkReadRequest(
    account: NotificationReplyAccount,
    channelId: String,
    messageId: String,
    features: String? = null,
): NotificationReplyRequest? {
    val base = account.apiBaseUrl.trim().trimEnd('/')
    val authorization = replyAuthorizationHeader(account.token)
    if (base.isEmpty() || authorization.isEmpty() || channelId.isEmpty() || messageId.isEmpty()) {
        return null
    }
    return NotificationReplyRequest(
        url = "$base/channels/${pathSegment(channelId)}/messages/${pathSegment(messageId)}/ack",
        authorization = authorization,
        body = "{}",
        features = features?.trim()?.takeIf { it.isNotEmpty() },
    )
}

internal class NotificationMarkReadDispatcher(
    private val accounts: NotificationReplyAccountLookup,
    private val poster: NotificationReplyPoster,
    private val ui: NotificationMarkReadUi,
) {
    fun dispatch(input: NotificationMarkReadInput): NotificationMarkReadOutcome {
        if (input.channelId.isEmpty() || input.messageId.isEmpty() || input.userId.isEmpty()) {
            return NotificationMarkReadOutcome.Skipped
        }
        ui.clearRead(input)
        if (!send(input)) {
            ui.showFailure()
            return NotificationMarkReadOutcome.Failed
        }
        return NotificationMarkReadOutcome.Sent
    }

    private fun send(input: NotificationMarkReadInput): Boolean {
        return try {
            val request = accounts.read(input.userId)?.let {
                buildNotificationMarkReadRequest(
                    it,
                    input.channelId,
                    input.messageId,
                    input.features,
                )
            }
            request != null && poster.post(request)
        } catch (error: Exception) {
            FluxerNativeMeasure.reportHandled(
                error,
                source = "notification_mark_read",
                context = "ack",
            )
            false
        }
    }
}
