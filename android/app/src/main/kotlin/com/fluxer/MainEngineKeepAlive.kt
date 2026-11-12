package com.fluxer

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.IBinder
import io.flutter.embedding.engine.FlutterEngine

private const val AUDIO_SERVICE_CLASS = "com.ryanheise.audioservice.AudioService"
private const val MEDIA_BROWSER_SERVICE_ACTION = "android.media.browse.MediaBrowserService"

object MainEngineKeepAlive {
    private var trackedEngine: FlutterEngine? = null
    private var boundContext: Context? = null

    private val connection =
        object : ServiceConnection {
            override fun onServiceConnected(name: ComponentName?, service: IBinder?) {}

            override fun onServiceDisconnected(name: ComponentName?) {}
        }

    fun attach(context: Context, engine: FlutterEngine) {
        val appContext = context.applicationContext
        bindAudioService(appContext)
        if (trackedEngine === engine) {
            return
        }
        trackedEngine = engine
        MainEngineState.onEngineStarted()
        engine.addEngineLifecycleListener(
            object : FlutterEngine.EngineLifecycleListener {
                override fun onPreEngineRestart() {}

                override fun onEngineWillDestroy() {
                    if (trackedEngine !== engine) {
                        return
                    }
                    trackedEngine = null
                    MainEngineState.onEngineStopped()
                    VoiceTaskRemovedRegistry.bridge = null
                    stopVoiceTaskRemovedWatcher(appContext)
                    unbindAudioService()
                }
            },
        )
    }

    private fun bindAudioService(appContext: Context) {
        if (boundContext != null) {
            return
        }
        val intent =
            Intent(MEDIA_BROWSER_SERVICE_ACTION)
                .setComponent(ComponentName(appContext, AUDIO_SERVICE_CLASS))
        val bound =
            runCatching {
                appContext.bindService(intent, connection, Context.BIND_AUTO_CREATE)
            }.getOrDefault(false)
        if (bound) {
            boundContext = appContext
        }
    }

    private fun unbindAudioService() {
        val context = boundContext ?: return
        boundContext = null
        runCatching { context.unbindService(connection) }
    }
}
