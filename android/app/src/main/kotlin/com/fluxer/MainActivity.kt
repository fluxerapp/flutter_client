package com.fluxer

import android.content.Intent
import android.net.Uri
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
        FlutterCallkitIncomingPlugin.unregisterEventCallback(callkitEventCallback)
        super.onDestroy()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        NotificationCancelBridge(applicationContext).register(flutterEngine)
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
