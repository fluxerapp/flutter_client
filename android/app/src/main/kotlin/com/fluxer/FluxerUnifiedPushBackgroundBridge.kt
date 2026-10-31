package com.fluxer

import android.os.Handler
import android.os.Looper
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

internal class FluxerUnifiedPushBackgroundBridge :
    FlutterPlugin,
    MethodChannel.MethodCallHandler {
    private var channel: MethodChannel? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel =
            MethodChannel(binding.binaryMessenger, CHANNEL_NAME).also {
                it.setMethodCallHandler(this)
            }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
        channel = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            METHOD_PREPARE -> {
                result.success(null)
                handler.post { FluxerUnifiedPushService.onDartBackgroundReady() }
            }
            METHOD_FINISH -> {
                result.success(null)
                handler.post { FluxerUnifiedPushService.onDartBackgroundFinished() }
            }
            else -> result.notImplemented()
        }
    }

    companion object {
        const val CHANNEL_NAME = "com.fluxer/unified_push_background"
        const val METHOD_PREPARE = "prepare"
        const val METHOD_FINISH = "finish"

        private val handler = Handler(Looper.getMainLooper())

        fun registerWith(engine: FlutterEngine) {
            val registry = engine.plugins
            if (registry.get(FluxerUnifiedPushBackgroundBridge::class.java) == null) {
                registry.add(FluxerUnifiedPushBackgroundBridge())
            }
        }
    }
}

internal data class UnifiedPushFlutterEvent(
    val method: String,
    val data: Map<String, Any?>,
)
