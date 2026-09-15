package com.fluxer

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class AnimatorDurationScaleBridgeTest {
    @Test
    fun treatsZeroScaleAsDisabled() {
        assertTrue(isAnimatorDurationScaleDisabled(0f))
    }

    @Test
    fun treatsNonZeroScaleAsEnabled() {
        assertFalse(isAnimatorDurationScaleDisabled(1f))
        assertFalse(isAnimatorDurationScaleDisabled(0.5f))
    }
}
