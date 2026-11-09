package com.fluxer

import android.os.Build
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class AppLockBridge(
    private val activity: MainActivity,
) {
    fun register(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                METHOD_SET_HIDE_IN_RECENTS -> {
                    val hide = call.arguments as? Boolean ?: false
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                        activity.setRecentsScreenshotEnabled(!hide)
                    }
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    companion object {
        const val CHANNEL_NAME = "fluxer_app/app_lock"
        const val METHOD_SET_HIDE_IN_RECENTS = "setHideInRecents"
    }
}
