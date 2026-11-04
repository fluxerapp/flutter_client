package com.fluxer

internal class UnifiedPushDeliveryLedger {
    private var accepted = 0

    fun onAccepted() {
        accepted += 1
    }

    fun canClose(handled: Int): Boolean = handled >= accepted

    fun reset() {
        accepted = 0
    }
}
