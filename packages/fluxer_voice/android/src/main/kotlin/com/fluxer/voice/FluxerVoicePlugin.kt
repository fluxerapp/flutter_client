package com.fluxer.voice

import android.app.Activity
import com.fluxer.voice.pip.VoicePipController
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry

class FluxerVoicePlugin : FlutterPlugin, ActivityAware {
    private var activity: Activity? = null
    private var session: VoiceAudioSession? = null
    private var routeBridge: VoiceAudioSessionBridge? = null
    private var callGuardBridge: SystemVoiceCallGuardBridge? = null
    private var pip: VoicePipController? = null
    private var activityBinding: ActivityPluginBinding? = null
    private val userLeaveHint = PluginRegistry.UserLeaveHintListener {
        pip?.onUserLeaveHint()
    }

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
        pip = VoicePipController(context).also {
            it.register(binding.binaryMessenger)
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        routeBridge?.unregister()
        routeBridge = null
        callGuardBridge?.unregister()
        callGuardBridge = null
        pip?.attachActivity(null)
        pip?.unregister()
        pip = null
        session = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        bindActivity(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        bindActivity(null)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        bindActivity(binding)
    }

    override fun onDetachedFromActivity() {
        bindActivity(null)
    }

    private fun bindActivity(binding: ActivityPluginBinding?) {
        activityBinding?.removeOnUserLeaveHintListener(userLeaveHint)
        activityBinding = binding
        binding?.addOnUserLeaveHintListener(userLeaveHint)
        pip?.attachActivity(binding?.activity)
        setActivity(binding?.activity)
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
