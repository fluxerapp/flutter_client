package com.fluxer

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class UnifiedPushDeliveryLedgerTest {
    @Test
    fun closesWithNothingAccepted() {
        assertTrue(UnifiedPushDeliveryLedger().canClose(0))
    }

    @Test
    fun staysOpenUntilEveryAcceptedMessageIsHandled() {
        val ledger = UnifiedPushDeliveryLedger()
        ledger.onAccepted()
        ledger.onAccepted()

        assertFalse(ledger.canClose(0))
        assertFalse(ledger.canClose(1))
        assertTrue(ledger.canClose(2))
    }

    @Test
    fun resetsForTheNextSession() {
        val ledger = UnifiedPushDeliveryLedger()
        ledger.onAccepted()
        ledger.reset()

        assertTrue(ledger.canClose(0))
    }
}
