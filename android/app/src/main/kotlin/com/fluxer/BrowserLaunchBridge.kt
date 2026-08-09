package com.fluxer

import android.content.Context
import android.content.Intent
import android.net.Uri
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class BrowserLaunchBridge(
    private val context: Context,
) {
    fun register(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                METHOD_OPEN_URL_IN_BROWSER -> {
                    val url = call.argument<String>(ARG_URL)
                    val packageName = call.argument<String>(ARG_PACKAGE_NAME)
                    if (url.isNullOrEmpty() || packageName.isNullOrEmpty()) {
                        result.success(false)
                        return@setMethodCallHandler
                    }
                    result.success(openUrlInBrowser(url, packageName))
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun openUrlInBrowser(url: String, packageName: String): Boolean {
        return try {
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url)).apply {
                setPackage(packageName)
                addCategory(Intent.CATEGORY_BROWSABLE)
                flags = Intent.FLAG_ACTIVITY_NEW_TASK
            }
            context.startActivity(intent)
            true
        } catch (_: Exception) {
            false
        }
    }

    companion object {
        const val CHANNEL_NAME = "fluxer_app/browser_launch"
        const val METHOD_OPEN_URL_IN_BROWSER = "openUrlInBrowser"
        const val ARG_URL = "url"
        const val ARG_PACKAGE_NAME = "packageName"
    }
}
