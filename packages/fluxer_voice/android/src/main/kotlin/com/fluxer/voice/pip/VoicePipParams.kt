package com.fluxer.voice.pip

import android.graphics.Rect
import com.fluxer.voice.NativePipConfig
import kotlin.math.roundToInt

internal data class VoicePipSpec(
    val aspectWidth: Int,
    val aspectHeight: Int,
    val sourceRect: Rect?,
)

internal object VoicePipParams {
    private const val MAX_RATIO_NUMERATOR = 238
    private const val RATIO_DENOMINATOR = 100

    fun clampAspect(width: Long, height: Long): Pair<Int, Int> {
        if (width <= 0 || height <= 0) {
            return 16 to 9
        }
        val ratio = width.toDouble() / height.toDouble()
        val max = MAX_RATIO_NUMERATOR.toDouble() / RATIO_DENOMINATOR
        return when {
            ratio > max -> MAX_RATIO_NUMERATOR to RATIO_DENOMINATOR
            ratio < 1 / max -> RATIO_DENOMINATOR to MAX_RATIO_NUMERATOR
            else -> (ratio * 1000).roundToInt().coerceAtLeast(1) to 1000
        }
    }

    fun spec(config: NativePipConfig?, density: Float): VoicePipSpec? {
        config ?: return null
        val (aspectWidth, aspectHeight) = clampAspect(config.aspectWidth, config.aspectHeight)
        val rect = config.sourceRect?.let {
            val left = (it.left * density).roundToInt()
            val top = (it.top * density).roundToInt()
            val right = ((it.left + it.width) * density).roundToInt()
            val bottom = ((it.top + it.height) * density).roundToInt()
            if (right > left && bottom > top) Rect(left, top, right, bottom) else null
        }
        return VoicePipSpec(aspectWidth, aspectHeight, rect)
    }
}
