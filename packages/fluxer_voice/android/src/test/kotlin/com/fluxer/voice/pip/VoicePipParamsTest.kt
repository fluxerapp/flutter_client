package com.fluxer.voice.pip

import android.graphics.Rect
import android.os.Build
import com.fluxer.voice.NativePipConfig
import com.fluxer.voice.NativePipRect
import com.fluxer.voice.NativePipVideoSource
import com.fluxer.voice.NativePipVideoSourceKind
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [Build.VERSION_CODES.S])
class VoicePipParamsTest {
    private fun config(
        width: Long = 1778,
        height: Long = 1000,
        rect: NativePipRect? = null,
    ) = NativePipConfig(
        source = NativePipVideoSource(NativePipVideoSourceKind.WEB_RTC_TRACK, "track"),
        aspectWidth = width,
        aspectHeight = height,
        sourceRect = rect,
        mirror = false,
    )

    @Test
    fun aspectWithinBoundsIsKept() {
        assertEquals(1778 to 1000, VoicePipParams.clampAspect(1778, 1000))
        assertEquals(1000 to 1000, VoicePipParams.clampAspect(720, 720))
    }

    @Test
    fun extremeAspectsAreClamped() {
        assertEquals(238 to 100, VoicePipParams.clampAspect(4000, 1000))
        assertEquals(100 to 238, VoicePipParams.clampAspect(1000, 4000))
    }

    @Test
    fun invalidAspectFallsBackToWidescreen() {
        assertEquals(16 to 9, VoicePipParams.clampAspect(0, 9))
        assertEquals(16 to 9, VoicePipParams.clampAspect(16, -1))
    }

    @Test
    fun noConfigMeansDisarmed() {
        assertNull(VoicePipParams.spec(null, 2f))
    }

    @Test
    fun sourceRectIsScaledToPhysicalPixels() {
        val spec = VoicePipParams.spec(
            config(rect = NativePipRect(left = 10.0, top = 20.0, width = 160.0, height = 90.0)),
            density = 2f,
        )!!
        assertEquals(Rect(20, 40, 340, 220), spec.sourceRect)
    }

    @Test
    fun emptySourceRectIsDropped() {
        val spec = VoicePipParams.spec(
            config(rect = NativePipRect(left = 0.0, top = 0.0, width = 0.0, height = 90.0)),
            density = 3f,
        )!!
        assertNull(spec.sourceRect)
    }
}
