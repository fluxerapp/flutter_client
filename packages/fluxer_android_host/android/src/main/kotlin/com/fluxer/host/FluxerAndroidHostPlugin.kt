package com.fluxer.host

import io.flutter.embedding.engine.plugins.FlutterPlugin

class FluxerAndroidHostPlugin : FlutterPlugin {
    private var animatorDurationScale: AnimatorDurationScaleBridge? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        animatorDurationScale =
            AnimatorDurationScaleBridge(binding.applicationContext).also {
                it.register(binding.binaryMessenger)
            }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        animatorDurationScale?.unregister(binding.binaryMessenger)
        animatorDurationScale = null
    }
}
