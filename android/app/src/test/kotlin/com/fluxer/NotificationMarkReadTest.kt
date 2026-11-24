package com.fluxer

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

class NotificationMarkReadTest {
    private val account = NotificationReplyAccount("Bearer token", "https://api.example/v1/")

    @Test
    fun buildsTheAckPost() {
        val request = buildNotificationMarkReadRequest(
            account = account,
            channelId = "channel/1",
            messageId = "message-1",
            features = "channel_threads",
        )

        assertEquals(
            "https://api.example/v1/channels/channel%2F1/messages/message-1/ack",
            request?.url,
        )
        assertEquals("token", request?.authorization)
        assertEquals("{}", request?.body)
        assertEquals("channel_threads", request?.features)
    }

    @Test
    fun clearsBeforePosting() {
        val ui = RecordingMarkReadUi()
        var clearedBeforePost = false
        val outcome = NotificationMarkReadDispatcher(
            accounts = NotificationReplyAccountLookup { account },
            poster = NotificationReplyPoster {
                clearedBeforePost = ui.cleared?.messageId == "m"
                true
            },
            ui = ui,
        ).dispatch(sampleInput())

        assertEquals(NotificationMarkReadOutcome.Sent, outcome)
        assertTrue(clearedBeforePost)
        assertEquals("c", ui.cleared?.channelId)
        assertEquals("channel:c", ui.cleared?.tag)
        assertFalse(ui.failed)
    }

    @Test
    fun failedPostShowsAFailure() {
        val ui = RecordingMarkReadUi()
        val outcome = dispatcher(account, posted = false, ui = ui).dispatch(sampleInput())

        assertEquals(NotificationMarkReadOutcome.Failed, outcome)
        assertTrue(ui.failed)
    }

    @Test
    fun throwingAccountLookupShowsAFailure() {
        val ui = RecordingMarkReadUi()
        val outcome = NotificationMarkReadDispatcher(
            accounts = NotificationReplyAccountLookup { error("locked") },
            poster = NotificationReplyPoster { true },
            ui = ui,
        ).dispatch(sampleInput())

        assertEquals(NotificationMarkReadOutcome.Failed, outcome)
        assertTrue(ui.failed)
    }

    @Test
    fun missingAccountShowsAFailure() {
        val ui = RecordingMarkReadUi()
        val outcome = dispatcher(null, posted = true, ui = ui).dispatch(sampleInput())

        assertEquals(NotificationMarkReadOutcome.Failed, outcome)
        assertTrue(ui.failed)
    }

    @Test
    fun incompleteInputLeavesTheNotification() {
        val ui = RecordingMarkReadUi()
        val outcome = dispatcher(account, posted = true, ui = ui)
            .dispatch(sampleInput().copy(messageId = ""))

        assertEquals(NotificationMarkReadOutcome.Skipped, outcome)
        assertNull(ui.cleared)
        assertFalse(ui.failed)
    }

    private fun dispatcher(
        account: NotificationReplyAccount?,
        posted: Boolean,
        ui: RecordingMarkReadUi,
    ): NotificationMarkReadDispatcher {
        return NotificationMarkReadDispatcher(
            accounts = NotificationReplyAccountLookup { account },
            poster = NotificationReplyPoster { posted },
            ui = ui,
        )
    }

    private fun sampleInput(): NotificationMarkReadInput {
        return NotificationMarkReadInput(
            channelId = "c",
            messageId = "m",
            userId = "user-b",
            notificationId = 42,
            tag = "channel:c",
        )
    }
}

private class RecordingMarkReadUi : NotificationMarkReadUi {
    var cleared: NotificationMarkReadInput? = null
    var failed: Boolean = false

    override fun clearRead(input: NotificationMarkReadInput) {
        cleared = input
    }

    override fun showFailure() {
        failed = true
    }
}
