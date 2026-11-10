package com.fluxer

import android.os.Build
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class AppLockBridge(
    private val activity: MainActivity,
) {
    private var channel: MethodChannel? = null

    fun register(flutterEngine: FlutterEngine) {
        channel =
            MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                CHANNEL_NAME,
            ).also {
                it.setMethodCallHandler { call, result ->
                    when (call.method) {
                        METHOD_SET_ENABLED -> {
                            enabled = call.arguments as? Boolean ?: false
                            applyRecentsScreenshot()
                            result.success(null)
                        }
                        else -> result.notImplemented()
                    }
                }
            }
        applyRecentsScreenshot()
    }

    fun onPause() {
        if (enabled) {
            channel?.invokeMethod(METHOD_PAUSED, null)
        }
    }

    private fun applyRecentsScreenshot() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            activity.setRecentsScreenshotEnabled(!enabled)
        }
    }

    companion object {
        const val CHANNEL_NAME = "fluxer_app/app_lock"
        const val METHOD_SET_ENABLED = "setEnabled"
        const val METHOD_PAUSED = "paused"

        @Volatile
        private var enabled = false
    }
}
