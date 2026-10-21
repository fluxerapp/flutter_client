package com.fluxer

import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugins.GeneratedPluginRegistrant
import org.unifiedpush.flutter.connector.UnifiedPushService

class FluxerUnifiedPushService : UnifiedPushService() {
    private var backgroundEngine: FlutterEngine? = null

    override fun getEngine(context: Context): FlutterEngine {
        val cached = backgroundEngine
        if (cached != null) {
            return cached
        }
        return FlutterEngine(context).apply {
            GeneratedPluginRegistrant.registerWith(this)
            localizationPlugin.sendLocalesToFlutter(context.resources.configuration)
            dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault(),
                listOf("--unifiedpush-bg"),
            )
            backgroundEngine = this
        }
    }

    override fun onDestroy() {
        backgroundEngine?.destroy()
        backgroundEngine = null
        super.onDestroy()
    }
}
