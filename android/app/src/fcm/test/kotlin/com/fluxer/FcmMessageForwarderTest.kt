package com.fluxer

import android.os.Bundle
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class FcmMessageForwarderTest {
    @Test
    fun enrichNotificationIntoData_copiesGcmTitleAndBodyIntoDataFields() {
        val bundle =
            Bundle().apply {
                putString("gcm.notification.title", "Emptiest (#asdfqwer)")
                putString("gcm.notification.body", "Pong!")
                putString("channel_id", "dm-1")
                putString("url", "/channels/@me/dm-1/msg-9")
            }
        FcmMessageForwarder.enrichNotificationIntoData(bundle)
        assertEquals("Emptiest (#asdfqwer)", bundle.getString("title"))
        assertEquals("Pong!", bundle.getString("body"))
        assertEquals("dm-1", bundle.getString("channel_id"))
        assertEquals("/channels/@me/dm-1/msg-9", bundle.getString("url"))
    }

    @Test
    fun enrichNotificationIntoData_doesNotOverwriteExistingDataFields() {
        val bundle =
            Bundle().apply {
                putString("gcm.notification.title", "from-gcm")
                putString("gcm.notification.body", "from-gcm-body")
                putString("title", "from-data")
                putString("body", "from-data-body")
            }
        FcmMessageForwarder.enrichNotificationIntoData(bundle)
        assertEquals("from-data", bundle.getString("title"))
        assertEquals("from-data-body", bundle.getString("body"))
    }

    @Test
    fun enrichNotificationIntoData_ignoresBlankGcmNotificationFields() {
        val bundle =
            Bundle().apply {
                putString("gcm.notification.title", "   ")
                putString("gcm.notification.body", "")
            }
        FcmMessageForwarder.enrichNotificationIntoData(bundle)
        assertFalse(bundle.containsKey("title"))
        assertFalse(bundle.containsKey("body"))
    }
}
