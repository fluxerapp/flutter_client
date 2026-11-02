package com.fluxer.host

import android.content.Context
import android.database.ContentObserver
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel

private const val CHANNEL_NAME = "fluxer_app/android_animator_duration_scale"
private const val DEFAULT_SCALE = 1.0f

fun isAnimatorDurationScaleDisabled(scale: Float): Boolean = scale == 0f

class AnimatorDurationScaleBridge(
    private val context: Context,
) {
    private var handler: AnimatorDurationScaleHandler? = null

    fun register(messenger: BinaryMessenger) {
        val next = AnimatorDurationScaleHandler(context)
        handler = next
        EventChannel(messenger, CHANNEL_NAME).setStreamHandler(next)
    }

    fun unregister(messenger: BinaryMessenger) {
        handler?.stop()
        handler = null
        EventChannel(messenger, CHANNEL_NAME).setStreamHandler(null)
    }
}

private class AnimatorDurationScaleHandler(
    private val context: Context,
) : EventChannel.StreamHandler {
    private val mainHandler = Handler(Looper.getMainLooper())
    private var observer: ContentObserver? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
        stop()
        val resolver = context.contentResolver
        fun emit() {
            val scale =
                Settings.Global.getFloat(
                    resolver,
                    Settings.Global.ANIMATOR_DURATION_SCALE,
                    DEFAULT_SCALE,
                )
            events.success(isAnimatorDurationScaleDisabled(scale))
        }
        emit()
        val next =
            object : ContentObserver(mainHandler) {
                override fun onChange(selfChange: Boolean) = emit()

                override fun onChange(selfChange: Boolean, uri: Uri?) = emit()
            }
        observer = next
        resolver.registerContentObserver(
            Settings.Global.getUriFor(Settings.Global.ANIMATOR_DURATION_SCALE),
            false,
            next,
        )
    }

    override fun onCancel(arguments: Any?) {
        stop()
    }

    fun stop() {
        val current = observer ?: return
        context.contentResolver.unregisterContentObserver(current)
        observer = null
    }
}
