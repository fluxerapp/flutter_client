package com.fluxer

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.view.KeyEvent
import com.hiennv.flutter_callkit_incoming.CallkitEventCallback
import com.hiennv.flutter_callkit_incoming.FlutterCallkitIncomingPlugin
import com.ryanheise.audioservice.AudioServiceFragmentActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.android.RenderMode
import io.flutter.embedding.android.TransparencyMode
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : AudioServiceFragmentActivity() {
    private val imeEditingShortcutBridge = ImeEditingShortcutBridge()
    private val appLockBridge = AppLockBridge(this)

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
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            splashScreen.setOnExitAnimationListener { view ->
                view.animate()
                    .alpha(0f)
                    .setDuration(200L)
                    .withEndAction { view.remove() }
                    .start()
            }
        }
        FlutterCallkitIncomingPlugin.registerEventCallback(callkitEventCallback)
    }

    override fun onNewIntent(intent: Intent) {
        if (deferOAuthDeepLinkToBrowser(intent)) {
            return
        }
        super.onNewIntent(intent)
    }

    override fun onStart() {
        super.onStart()
        MainEngineState.onActivityStarted()
    }

    override fun onPause() {
        appLockBridge.onPause()
        super.onPause()
    }

    override fun onStop() {
        MainEngineState.onActivityStopped()
        super.onStop()
    }

    override fun onDestroy() {
        FlutterCallkitIncomingPlugin.unregisterEventCallback(callkitEventCallback)
        super.onDestroy()
    }

    override fun createFlutterFragment(): FlutterFragment {
        return FlutterFragment.CachedEngineFragmentBuilder(
            MainFlutterFragment::class.java,
            requireNotNull(cachedEngineId),
        )
            .renderMode(renderMode)
            .transparencyMode(
                if (backgroundMode == FlutterActivityLaunchConfigs.BackgroundMode.opaque) {
                    TransparencyMode.opaque
                } else {
                    TransparencyMode.transparent
                },
            )
            .handleDeeplinking(shouldHandleDeeplinking())
            .shouldAttachEngineToActivity(shouldAttachEngineToActivity())
            .destroyEngineWithFragment(shouldDestroyEngineWithHost())
            .shouldDelayFirstAndroidViewDraw(renderMode == RenderMode.surface)
            .shouldAutomaticallyHandleOnBackPressed(true)
            .build()
    }

    override fun dispatchKeyEvent(event: KeyEvent): Boolean {
        if (imeEditingShortcutBridge.dispatch(event)) {
            return true
        }
        return super.dispatchKeyEvent(event)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MainEngineKeepAlive.attach(this, flutterEngine)
        BrowserLaunchBridge(applicationContext).register(flutterEngine)
        PhysicalKeyboardBridge(applicationContext).register(flutterEngine)
        VoiceTaskRemovedBridge(applicationContext).also { bridge ->
            bridge.register(flutterEngine)
            VoiceTaskRemovedRegistry.bridge = bridge
        }
        AppRestartBridge(this).register(flutterEngine)
        appLockBridge.register(flutterEngine)
        PlayAgeRangeBridge(this).register(flutterEngine)
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
