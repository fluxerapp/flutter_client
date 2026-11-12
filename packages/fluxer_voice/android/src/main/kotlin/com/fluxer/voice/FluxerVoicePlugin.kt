package com.fluxer.voice

import android.app.Activity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

class FluxerVoicePlugin : FlutterPlugin, ActivityAware {
    private var activity: Activity? = null
    private var session: VoiceAudioSession? = null
    private var routeBridge: VoiceAudioSessionBridge? = null
    private var callGuardBridge: SystemVoiceCallGuardBridge? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val context = binding.applicationContext
        val shared = VoiceAudioSession.shared(context)
        session = shared
        routeBridge = VoiceAudioSessionBridge(shared).also {
            it.register(binding.binaryMessenger)
        }
        callGuardBridge = SystemVoiceCallGuardBridge(context).also {
            it.register(binding.binaryMessenger)
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        routeBridge?.unregister()
        routeBridge = null
        callGuardBridge?.unregister()
        callGuardBridge = null
        session = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        setActivity(binding.activity)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        setActivity(null)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        setActivity(binding.activity)
    }

    override fun onDetachedFromActivity() {
        setActivity(null)
    }

    private fun setActivity(next: Activity?) {
        val previous = activity
        activity = next
        val shared = session ?: return
        shared.handler.post {
            if (next != null) {
                shared.activityProvider = { next }
            } else if (shared.activityProvider() === previous) {
                shared.activityProvider = { null }
            }
            shared.onActivityVisibilityChanged()
        }
    }
}
