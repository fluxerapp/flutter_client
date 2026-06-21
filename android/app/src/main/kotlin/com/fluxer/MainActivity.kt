package com.fluxer

import android.os.Bundle
import com.hiennv.flutter_callkit_incoming.CallkitEventCallback
import com.hiennv.flutter_callkit_incoming.FlutterCallkitIncomingPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    private val callkitEventCallback = object : CallkitEventCallback {
        override fun onCallEvent(
            event: CallkitEventCallback.CallEvent,
            callData: Bundle,
        ) {}
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        FlutterCallkitIncomingPlugin.registerEventCallback(callkitEventCallback)
    }

    override fun onDestroy() {
        FlutterCallkitIncomingPlugin.unregisterEventCallback(callkitEventCallback)
        super.onDestroy()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        NotificationCancelBridge(applicationContext).register(flutterEngine)
    }
}
