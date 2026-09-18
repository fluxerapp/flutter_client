package com.fluxer

import android.content.ComponentCallbacks
import android.content.Context
import android.content.res.Configuration
import android.os.Handler
import android.os.Looper
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

private const val CHANNEL_NAME = "fluxer_app/physical_keyboard"

internal fun isPhysicalKeyboardConnected(configuration: Configuration): Boolean {
    if (configuration.hardKeyboardHidden != Configuration.HARDKEYBOARDHIDDEN_NO) {
        return false
    }
    return configuration.keyboard == Configuration.KEYBOARD_QWERTY ||
        configuration.keyboard == Configuration.KEYBOARD_12KEY
}

class PhysicalKeyboardBridge(
    private val context: Context,
) {
    fun register(flutterEngine: FlutterEngine) {
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME,
        ).setStreamHandler(PhysicalKeyboardHandler(context))
    }
}

private class PhysicalKeyboardHandler(
    private val context: Context,
) : EventChannel.StreamHandler, ComponentCallbacks {
    private val mainHandler = Handler(Looper.getMainLooper())
    private var events: EventChannel.EventSink? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
        stopListening()
        this.events = events
        context.registerComponentCallbacks(this)
        emit()
    }

    override fun onCancel(arguments: Any?) {
        stopListening()
    }

    override fun onConfigurationChanged(newConfig: Configuration) {
        emit(newConfig)
    }

    override fun onLowMemory() {}

    private fun emit(configuration: Configuration = context.resources.configuration) {
        val connected = isPhysicalKeyboardConnected(configuration)
        val sink = events ?: return
        if (Looper.myLooper() == Looper.getMainLooper()) {
            sink.success(connected)
            return
        }
        mainHandler.post {
            events?.success(connected)
        }
    }

    private fun stopListening() {
        if (events == null) {
            return
        }
        context.unregisterComponentCallbacks(this)
        events = null
    }
}
