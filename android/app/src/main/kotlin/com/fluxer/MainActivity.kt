package com.fluxer

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.view.KeyEvent
import com.hiennv.flutter_callkit_incoming.CallkitEventCallback
import com.hiennv.flutter_callkit_incoming.FlutterCallkitIncomingPlugin
import com.ryanheise.audioservice.AudioServiceActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : AudioServiceActivity() {
    private val imeEditingShortcutBridge = ImeEditingShortcutBridge()
    private var ownsMainEngine = false

    private val callkitEventCallback = object : CallkitEventCallback {
        override fun onCallEvent(
            event: CallkitEventCallback.CallEvent,
            callData: Bundle,
        ) {}
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        if (deferOAuthDeepLinkToBrowser(intent)) {
            return
        }
        super.onCreate(savedInstanceState)
        FlutterCallkitIncomingPlugin.registerEventCallback(callkitEventCallback)
    }

    override fun onNewIntent(intent: Intent) {
        if (deferOAuthDeepLinkToBrowser(intent)) {
            return
        }
        super.onNewIntent(intent)
    }

    override fun onDestroy() {
        val ownedEngine = ownsMainEngine
        ownsMainEngine = false
        FlutterCallkitIncomingPlugin.unregisterEventCallback(callkitEventCallback)
        super.onDestroy()
        if (ownedEngine) {
            FluxerUnifiedPushService.noteMainEngineStopped()
        }
    }

    override fun popSystemNavigator(): Boolean = moveTaskToBack(true)

    override fun dispatchKeyEvent(event: KeyEvent): Boolean {
        if (imeEditingShortcutBridge.dispatch(event)) {
            return true
        }
        return super.dispatchKeyEvent(event)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        ownsMainEngine = true
        FluxerUnifiedPushService.noteMainEngineStarted()
        BrowserLaunchBridge(applicationContext).register(flutterEngine)
        AnimatorDurationScaleBridge(applicationContext).register(flutterEngine)
        PhysicalKeyboardBridge(applicationContext).register(flutterEngine)
        NotificationReplyBridge(applicationContext).register(flutterEngine)
        VoiceSpeakerRouteBridge(applicationContext).register(flutterEngine)
        AppRestartBridge(this).register(flutterEngine)
        UploadKeepAliveBridge(applicationContext).register(flutterEngine)
        imeEditingShortcutBridge.register(flutterEngine)
        MeasureReporting.register(flutterEngine, application)
    }

    private fun deferOAuthDeepLinkToBrowser(intent: Intent?): Boolean {
        val browserUri = resolveOAuthBrowserUri(intent?.data) ?: return false
        val browserIntent = Intent(Intent.ACTION_VIEW, browserUri).apply {
            addCategory(Intent.CATEGORY_BROWSABLE)
            flags = Intent.FLAG_ACTIVITY_NEW_TASK
        }
        startActivity(browserIntent)
        finish()
        return true
    }

    private fun resolveOAuthBrowserUri(uri: Uri?): Uri? {
        if (uri == null) {
            return null
        }
        val path = uri.path ?: return null
        if (!path.startsWith(OAUTH_PATH_PREFIX)) {
            return null
        }
        return when (uri.scheme) {
            "https" -> {
                if (uri.host in OFFICIAL_APP_LINK_HOSTS) uri else null
            }
            else -> null
        }
    }

    private companion object {
        const val OAUTH_PATH_PREFIX = "/oauth2/"

        val OFFICIAL_APP_LINK_HOSTS = setOf(
            "web.fluxer.app",
            "web.canary.fluxer.app",
            "web.fluxer.com",
            "web.canary.fluxer.com",
            "fluxer.gg",
        )
    }
}
