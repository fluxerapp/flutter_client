package com.fluxer

import android.annotation.SuppressLint
import android.content.Intent
import android.net.Uri
import android.os.PowerManager
import android.provider.Settings
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class UnifiedPushBackgroundDeliveryBridge(
    private val activity: MainActivity,
) {
    fun register(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                METHOD_IS_RESTRICTED -> result.success(isRestricted())
                METHOD_REQUEST_EXEMPTION -> result.success(requestExemption())
                else -> result.notImplemented()
            }
        }
    }

    private fun isRestricted(): Boolean {
        if (isExempt()) {
            UnifiedPushBackgroundDeliveryStore.clear(activity)
            return false
        }
        return UnifiedPushBackgroundDeliveryStore.wasForegroundStartRefused(activity)
    }

    private fun isExempt(): Boolean {
        val power = activity.getSystemService(PowerManager::class.java) ?: return false
        return power.isIgnoringBatteryOptimizations(activity.packageName)
    }

    @SuppressLint("BatteryLife")
    private fun requestExemption(): Boolean {
        val direct =
            Intent(
                Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
                Uri.fromParts("package", activity.packageName, null),
            )
        val fallback = Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS)
        return listOf(direct, fallback).any { intent ->
            runCatching { activity.startActivity(intent) }.isSuccess
        }
    }

    companion object {
        const val CHANNEL_NAME = "fluxer_app/unified_push_background_delivery"
        const val METHOD_IS_RESTRICTED = "isRestricted"
        const val METHOD_REQUEST_EXEMPTION = "requestExemption"
    }
}
