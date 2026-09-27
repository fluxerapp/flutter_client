package com.fluxer

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class NotificationReplyTest {
    @Test
    fun buildsTheMessagePost() {
        val request = buildNotificationReplyRequest(
            account = NotificationReplyAccount(
                token = "Bearer session-token",
                apiBaseUrl = "https://api.fluxer.app/v1/",
            ),
            channelId = "channel/1",
            messageId = "message-1",
            content = "hello \"there\"",
        )

        assertEquals(
            "https://api.fluxer.app/v1/channels/channel%2F1/messages",
            request?.url,
        )
        assertEquals("session-token", request?.authorization)
        assertEquals(
            """{"content":"hello \"there\"","message_reference":{"message_id":"message-1"},"allowed_mentions":{"replied_user":true}}""",
            request?.body,
        )
    }

    @Test
    fun leavesARawTokenAlone() {
        assertEquals("session-token", replyAuthorizationHeader(" session-token "))
    }

    @Test
    fun successCancelsTheNotification() {
        val ui = RecordingReplyUi()
        val outcome = dispatcher(
            account = NotificationReplyAccount("token", "https://api.example/v1"),
            posted = true,
            ui = ui,
        ).dispatch(sampleInput())

        assertEquals(NotificationReplyOutcome.Sent, outcome)
        assertEquals(42, ui.cancelledId)
        assertEquals("channel:c:m", ui.cancelledTag)
        assertFalse(ui.clearedSending)
        assertFalse(ui.failed)
    }

    @Test
    fun missingAccountDoesNotCancel() {
        val ui = RecordingReplyUi()
        val outcome = dispatcher(account = null, posted = true, ui = ui).dispatch(sampleInput())

        assertEquals(NotificationReplyOutcome.Failed, outcome)
        assertNull(ui.cancelledId)
        assertTrue(ui.clearedSending)
        assertTrue(ui.failed)
    }

    @Test
    fun failedPostDoesNotCancel() {
        val ui = RecordingReplyUi()
        val outcome = dispatcher(
            account = NotificationReplyAccount("token", "https://api.example/v1"),
            posted = false,
            ui = ui,
        ).dispatch(sampleInput())

        assertEquals(NotificationReplyOutcome.Failed, outcome)
        assertNull(ui.cancelledId)
        assertTrue(ui.clearedSending)
        assertTrue(ui.failed)
    }

    @Test
    fun blankReplyClearsSendingWithoutAFailure() {
        val ui = RecordingReplyUi()
        val outcome = dispatcher(
            account = NotificationReplyAccount("token", "https://api.example/v1"),
            posted = true,
            ui = ui,
        ).dispatch(sampleInput().copy(text = "  "))

        assertEquals(NotificationReplyOutcome.Skipped, outcome)
        assertNull(ui.cancelledId)
        assertTrue(ui.clearedSending)
        assertFalse(ui.failed)
    }

    private fun dispatcher(
        account: NotificationReplyAccount?,
        posted: Boolean,
        ui: RecordingReplyUi,
    ): NotificationReplyDispatcher {
        return NotificationReplyDispatcher(
            accounts = NotificationReplyAccountLookup { account },
            poster = NotificationReplyPoster { posted },
            ui = ui,
        )
    }

    private fun sampleInput(): NotificationReplyInput {
        return NotificationReplyInput(
            text = "hello",
            channelId = "c",
            messageId = "m",
            userId = "user-b",
            notificationId = 42,
            tag = "channel:c:m",
        )
    }
}

private class RecordingReplyUi : NotificationReplyUi {
    var cancelledId: Int? = null
    var cancelledTag: String? = null
    var clearedSending: Boolean = false
    var failed: Boolean = false

    override fun cancel(id: Int, tag: String?) {
        cancelledId = id
        cancelledTag = tag
    }

    override fun clearSending(id: Int, tag: String?) {
        clearedSending = true
    }

    override fun showFailure() {
        failed = true
    }
}
