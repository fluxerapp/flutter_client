package com.fluxer

import android.app.Activity
import android.os.Build
import android.provider.Settings
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class SystemInsetsBridge(
    private val activity: Activity,
) {
    fun register(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                METHOD_NAVIGATION_BAR_HEIGHT -> {
                    result.success(navigationBarHeightPx())
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun navigationBarHeightPx(): Int {
        // gestures still report the pill height, skip it
        if (navigationMode() == NAVIGATION_MODE_GESTURAL) {
            return 0
        }
        val liveHeight = liveNavigationBarHeightPx()
        if (liveHeight > 0) {
            return liveHeight
        }
        return navigationBarHeightFromResources()
    }

    private fun liveNavigationBarHeightPx(): Int {
        val insets = rootWindowInsets() ?: return 0
        val navigationBars = insets.getInsets(
            WindowInsetsCompat.Type.navigationBars(),
        )
        if (navigationBars.bottom > 0) {
            return navigationBars.bottom
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            val tappable = insets.getInsets(
                WindowInsetsCompat.Type.tappableElement(),
            )
            if (tappable.bottom > 0) {
                return tappable.bottom
            }
        }
        return 0
    }

    private fun rootWindowInsets(): WindowInsetsCompat? {
        val decorView = activity.window?.decorView ?: return null
        return ViewCompat.getRootWindowInsets(decorView)
    }

    private fun navigationMode(): Int {
        // OEM overlays can change this, check resources first
        configNavigationMode()?.let { return it }
        return try {
            Settings.Secure.getInt(
                activity.contentResolver,
                "navigation_mode",
                NAVIGATION_MODE_THREE_BUTTONS,
            )
        } catch (_: Exception) {
            NAVIGATION_MODE_THREE_BUTTONS
        }
    }

    private fun configNavigationMode(): Int? {
        return try {
            val resourceId = activity.resources.getIdentifier(
                "config_navBarInteractionMode",
                "integer",
                "android",
            )
            if (resourceId > 0) {
                activity.resources.getInteger(resourceId)
            } else {
                null
            }
        } catch (_: Exception) {
            null
        }
    }

    private fun navigationBarHeightFromResources(): Int {
        val resources = activity.resources
        val resourceId = resources.getIdentifier(
            "navigation_bar_height",
            "dimen",
            "android",
        )
        if (resourceId > 0) {
            return resources.getDimensionPixelSize(resourceId)
        }
        return 0
    }

    companion object {
        const val CHANNEL_NAME = "fluxer_app/system_insets"
        const val METHOD_NAVIGATION_BAR_HEIGHT = "navigationBarHeight"

        const val NAVIGATION_MODE_THREE_BUTTONS = 0
        const val NAVIGATION_MODE_GESTURAL = 2
    }
}
