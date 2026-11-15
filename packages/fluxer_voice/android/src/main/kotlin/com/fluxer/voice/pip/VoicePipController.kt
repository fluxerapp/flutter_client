package com.fluxer.voice.pip

import android.app.Activity
import android.app.PictureInPictureParams
import android.content.Context
import android.content.pm.PackageManager
import android.content.res.Configuration
import android.os.Build
import android.util.Rational
import androidx.annotation.RequiresApi
import androidx.core.app.OnPictureInPictureModeChangedProvider
import androidx.core.app.PictureInPictureModeChangedInfo
import androidx.core.util.Consumer
import com.fluxer.voice.NativePipConfig
import com.fluxer.voice.NativePipEvent
import com.fluxer.voice.PigeonEventSink
import com.fluxer.voice.VoicePipEventsStreamHandler
import com.fluxer.voice.VoicePipHostApi
import io.flutter.plugin.common.BinaryMessenger

internal class VoicePipController(
    private val context: Context,
) : VoicePipHostApi {
    private var activity: Activity? = null
    private var messenger: BinaryMessenger? = null
    private var config: NativePipConfig? = null
    private var applied: AppliedSpec? = null
    private var sink: PigeonEventSink<NativePipEvent>? = null

    private val modeListener = Consumer<PictureInPictureModeChangedInfo> { info ->
        val newConfig = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) info.newConfig else null
        onModeChanged(info.isInPictureInPictureMode, newConfig)
    }

    private val eventStream = object : VoicePipEventsStreamHandler() {
        override fun onListen(p0: Any?, sink: PigeonEventSink<NativePipEvent>) {
            this@VoicePipController.sink = sink
        }

        override fun onCancel(p0: Any?) {
            sink = null
        }
    }

    fun register(messenger: BinaryMessenger) {
        this.messenger = messenger
        VoicePipHostApi.setUp(messenger, this)
        VoicePipEventsStreamHandler.register(messenger, eventStream)
    }

    fun unregister() {
        messenger?.let { VoicePipHostApi.setUp(it, null) }
        messenger = null
        sink = null
    }

    fun attachActivity(next: Activity?) {
        val previous = activity
        if (previous === next) {
            return
        }
        (previous as? OnPictureInPictureModeChangedProvider)
            ?.removeOnPictureInPictureModeChangedListener(modeListener)
        activity = next
        applied = null
        (next as? OnPictureInPictureModeChangedProvider)
            ?.addOnPictureInPictureModeChangedListener(modeListener)
        applyParams()
    }

    fun onUserLeaveHint() {
        if (Build.VERSION.SDK_INT !in Build.VERSION_CODES.O until Build.VERSION_CODES.S) {
            return
        }
        val activity = activity ?: return
        val spec = applied?.spec ?: return
        try {
            activity.enterPictureInPictureMode(buildParams(spec))
        } catch (_: IllegalStateException) {
        } catch (_: IllegalArgumentException) {
        }
    }

    override fun isSupported(): Boolean {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.O &&
            context.packageManager.hasSystemFeature(PackageManager.FEATURE_PICTURE_IN_PICTURE)
    }

    override fun arm(config: NativePipConfig) {
        this.config = config
        applyParams()
    }

    override fun disarm() {
        config = null
        applyParams()
    }

    override fun stop() {
        val activity = activity ?: return
        if (isInPictureInPicture(activity)) {
            activity.moveTaskToBack(false)
        }
    }

    private fun applyParams() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) {
            return
        }
        val activity = activity ?: return
        val next = AppliedSpec(VoicePipParams.spec(config, density()))
        if (next == applied) {
            return
        }
        val spec = next.spec
        if (spec == null && Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            applied = next
            return
        }
        try {
            activity.setPictureInPictureParams(
                if (spec == null) disabledParams() else buildParams(spec),
            )
            applied = next
        } catch (_: IllegalStateException) {
        } catch (_: IllegalArgumentException) {
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    private fun buildParams(spec: VoicePipSpec): PictureInPictureParams {
        val builder = PictureInPictureParams.Builder()
            .setAspectRatio(Rational(spec.aspectWidth, spec.aspectHeight))
            .setSourceRectHint(spec.sourceRect)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            builder.setAutoEnterEnabled(true)
            builder.setSeamlessResizeEnabled(false)
        }
        return builder.build()
    }

    @RequiresApi(Build.VERSION_CODES.S)
    private fun disabledParams(): PictureInPictureParams {
        return PictureInPictureParams.Builder()
            .setAutoEnterEnabled(false)
            .build()
    }

    private fun onModeChanged(active: Boolean, newConfig: Configuration?) {
        val width = newConfig?.screenWidthDp?.takeIf { active && it > 0 }
        val height = newConfig?.screenHeightDp?.takeIf { active && it > 0 }
        sink?.success(
            NativePipEvent(
                active = active,
                restoreRequested = false,
                width = width?.toDouble(),
                height = height?.toDouble(),
            ),
        )
    }

    private fun isInPictureInPicture(activity: Activity): Boolean {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.N && activity.isInPictureInPictureMode
    }

    private fun density(): Float = context.resources.displayMetrics.density

    private data class AppliedSpec(val spec: VoicePipSpec?)
}
