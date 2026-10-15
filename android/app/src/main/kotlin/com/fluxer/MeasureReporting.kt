package com.fluxer

import android.app.Application
import android.content.Context
import android.content.pm.PackageManager
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import sh.measure.android.Measure
import sh.measure.android.config.MeasureConfig

object MeasureReporting {
    private const val PREFERENCES_NAME = "FlutterSharedPreferences"
    private const val ENABLED_KEY = "flutter.observability_reporting_enabled"
    private const val CHANNEL_NAME = "fluxer_app/measure_reporting"
    private const val METHOD_INITIALIZE = "initialize"

    fun startIfEnabled(application: Application) {
        val preferences = application.getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE)
        if (!preferences.getBoolean(ENABLED_KEY, false)) {
            return
        }
        if (initialize(application)) {
            Measure.start()
        }
    }

    fun register(flutterEngine: FlutterEngine, application: Application) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME,
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                METHOD_INITIALIZE -> result.success(initialize(application))
                else -> result.notImplemented()
            }
        }
    }

    private fun initialize(application: Application): Boolean {
        if (!configured(application)) {
            return false
        }
        Measure.init(application, MeasureConfig(autoStart = false))
        return true
    }

    private fun configured(application: Application): Boolean {
        val meta =
            application.packageManager
                .getApplicationInfo(application.packageName, PackageManager.GET_META_DATA)
                .metaData
        val apiKey = meta?.getString("sh.measure.android.API_KEY")?.trim() ?: ""
        val apiUrl = meta?.getString("sh.measure.android.API_URL")?.trim() ?: ""
        return apiKey.isNotEmpty() && apiUrl.isNotEmpty()
    }
}
