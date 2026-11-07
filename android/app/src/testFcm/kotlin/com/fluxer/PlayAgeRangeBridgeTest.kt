package com.fluxer

import com.google.android.play.agesignals.model.AgeRangeSource
import com.google.android.play.agesignals.model.AgeSignalsErrorCode
import com.google.android.play.agesignals.model.AgeSignalsStatus
import com.google.android.play.core.integrity.model.StandardIntegrityErrorCode
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class PlayAgeRangeBridgeTest {
    @Test
    fun sharedAccessContinuesToAgeSignals() {
        assertNull(ageAccessStatusPayload(AgeSignalsStatus.SHARED))
    }

    @Test
    fun notSharedAccessIsDeclined() {
        assertEquals(
            mapOf("status" to AGE_STATUS_DECLINED),
            ageAccessStatusPayload(AgeSignalsStatus.NOT_SHARED),
        )
    }

    @Test
    fun playStoreActionRequiredIsReported() {
        assertEquals(
            mapOf("status" to AGE_STATUS_PLAY_STORE_ACTION_REQUIRED),
            ageAccessStatusPayload(AgeSignalsStatus.VERIFICATION_REQUIRED),
        )
    }

    @Test
    fun missingLowerBoundIsNeverSharing() {
        assertEquals(
            mapOf("status" to AGE_STATUS_DECLINED),
            ageSignalsPayload(lower = null, upper = null, source = null),
        )
    }

    @Test
    fun closedRangeIncludesBothBoundsAndSource() {
        assertEquals(
            mapOf(
                "status" to AGE_STATUS_SHARING,
                "lowerBound" to 13,
                "upperBound" to 15,
                "ageRangeSource" to "tier_b",
            ),
            ageSignalsPayload(lower = 13, upper = 15, source = AgeRangeSource.TIER_B),
        )
    }

    @Test
    fun openRangeLeavesOutUpperBound() {
        assertEquals(
            mapOf(
                "status" to AGE_STATUS_SHARING,
                "lowerBound" to 18,
                "ageRangeSource" to "tier_d",
            ),
            ageSignalsPayload(lower = 18, upper = null, source = AgeRangeSource.TIER_D),
        )
    }

    @Test
    fun sourceTiersUseWireNames() {
        assertEquals("tier_a", ageRangeSourceWireValue(AgeRangeSource.TIER_A))
        assertEquals("tier_b", ageRangeSourceWireValue(AgeRangeSource.TIER_B))
        assertEquals("tier_c", ageRangeSourceWireValue(AgeRangeSource.TIER_C))
        assertEquals("tier_d", ageRangeSourceWireValue(AgeRangeSource.TIER_D))
        assertNull(ageRangeSourceWireValue(AgeRangeSource.UNSPECIFIED))
        assertNull(ageRangeSourceWireValue(null))
    }

    @Test
    fun notOwnedAndMissingStoreAskForPlayInstall() {
        val expected = mapOf("status" to AGE_STATUS_NOT_INSTALLED_FROM_PLAY)
        assertEquals(expected, ageSignalsErrorPayload(AgeSignalsErrorCode.APP_NOT_OWNED))
        assertEquals(expected, ageSignalsErrorPayload(AgeSignalsErrorCode.PLAY_STORE_NOT_FOUND))
    }

    @Test
    fun otherAgeSignalsErrorsAreUnavailable() {
        val expected = mapOf("status" to AGE_STATUS_UNAVAILABLE)
        assertEquals(expected, ageSignalsErrorPayload(AgeSignalsErrorCode.NETWORK_ERROR))
        assertEquals(expected, ageSignalsErrorPayload(null))
    }

    @Test
    fun integrityErrorsSplitIntoTransientAndUnavailable() {
        listOf(
            StandardIntegrityErrorCode.NETWORK_ERROR,
            StandardIntegrityErrorCode.TOO_MANY_REQUESTS,
            StandardIntegrityErrorCode.GOOGLE_SERVER_UNAVAILABLE,
            StandardIntegrityErrorCode.CLIENT_TRANSIENT_ERROR,
            StandardIntegrityErrorCode.INTERNAL_ERROR,
            StandardIntegrityErrorCode.INTEGRITY_TOKEN_PROVIDER_INVALID,
        ).forEach { assertEquals(INTEGRITY_ERROR_TRANSIENT, integrityErrorCode(it)) }
        assertEquals(
            INTEGRITY_ERROR_UNAVAILABLE,
            integrityErrorCode(StandardIntegrityErrorCode.API_NOT_AVAILABLE),
        )
        assertEquals(INTEGRITY_ERROR_UNAVAILABLE, integrityErrorCode(null))
    }
}
